#include <iostream>
#include <memory>
#include <string>
#include <vector>

#include "ff.h"
#include "sleep.h"
#include "xbyte_count.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "xscugic.h"

#include "CardIO.hpp"

#ifndef VERBOSE
// Default to verbose mode
#define VERBOSE 1
#endif

// Interrupt controller driver
XScuGic InterruptController;
XScuGic_Config *GicConfig;

// Accelerator driver
XByte_count AcceleratorHandle;
XByte_count_Config *AccelConfig;

// Filesystem driver
FATFS FatFs;

// Input data buffer
uint8_t data[1024] = { 0 };

// Timing
XTime start_time, end_time;

/*
 * Accelerator Done interrupt handler
 */
void AccelDoneInterruptHandler(void *InstancePtr) {
	XTime_GetTime(&end_time);

	// Clear ISR
	XByte_count_InterruptGetStatus(&AcceleratorHandle);
}

/*
 * Configure PS interrupt controller
 * Borrowed from Xilinx example:
 * https://github.com/Xilinx/embeddedsw/blob/master/XilinxProcessorIPLib/drivers/scugic/examples/xscugic_example.c
 */
int SetUpInterruptSystem(XScuGic *XScuGicInstancePtr) {

	/*
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the ARM processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler,
			XScuGicInstancePtr);

	/*
	 * Enable interrupts in the ARM
	 */
	Xil_ExceptionEnable()
	;

	return XST_SUCCESS;
}

/*
 * Configure XScuGic to handle desired PL interrupts
 * Borrowed from Xilinx example:
 * https://github.com/Xilinx/embeddedsw/blob/master/XilinxProcessorIPLib/drivers/scugic/examples/xscugic_example.c
 */
int AccelInterruptSetup() {
	int Status;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	GicConfig = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	if (NULL == GicConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(&InterruptController, GicConfig,
			GicConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built
	 * correctly
	 */
	Status = XScuGic_SelfTest(&InterruptController);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the Interrupt System
	 */
	Status = SetUpInterruptSystem(&InterruptController);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler performs
	 * the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(&InterruptController,
	XPAR_FABRIC_BYTE_COUNT_0_INTERRUPT_INTR,
			(Xil_ExceptionHandler) AccelDoneInterruptHandler,
			(void *) &InterruptController);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the device
	 */
	XScuGic_Enable(&InterruptController,
	XPAR_FABRIC_BYTE_COUNT_0_INTERRUPT_INTR);

	return XST_SUCCESS;
}

/*
 * Enable accelerator interrupts
 */
int BytecountInterruptInit() {
	// Interrupt bit 0 is ap_done, interrupt bit 1 is ap_ready
	XByte_count_InterruptEnable(&AcceleratorHandle, 0b01);
	XByte_count_InterruptGlobalEnable(&AcceleratorHandle);
	return XST_SUCCESS;
}

FRESULT initializeFS() {
	return f_mount(&FatFs, "", 0);
}

FRESULT cleanupFS() {
	return f_unmount("");
}

int main(void) {

	// Don't judge me
	std::cout
			<< "                  █▀▀ █▀█ █▀▄▀█ █▀█ █▀█ █▀▀ █▀ █▀ █ █▀█ █▄░█\n"
			<< "                  █▄▄ █▄█ █░▀░█ █▀▀ █▀▄ ██▄ ▄█ ▄█ █ █▄█ █░▀█\n"
			<< "                    █▀▀ █▀ ▀█▀ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█\n"
			<< "                    ██▄ ▄█ ░█░ █ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█\n"
			<< "                ▄▀█ █▀▀ █▀▀ █▀▀ █░░ █▀▀ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█\n"
			<< "                █▀█ █▄▄ █▄▄ ██▄ █▄▄ ██▄ █▀▄ █▀█ ░█░ █ █▄█ █░▀█\n"
			<< "                    █▄▄ █▀▀ █▄░█ █▀▀ █░█ █▀▄▀█ ▄▀█ █▀█ █▄▀\n"
			<< "                    █▄█ ██▄ █░▀█ █▄▄ █▀█ █░▀░█ █▀█ █▀▄ █░█\n";

	int Status;

	FRESULT Fr;

	Fr = initializeFS();
	if (Fr != FR_OK) {
		std::cerr << "Failed to mount filesystem\n";
	}

	std::vector<std::string> testFiles;
	listTests("/test_data", testFiles);

	std::cout << "\nIndexed " << testFiles.size() << " test files\n";
	if (VERBOSE == 1) {
		for (auto file : testFiles) {
			std::cout << " |  " << file << "\n";
		}
	}

	Status = XByte_count_Initialize(&AcceleratorHandle,
	XPAR_BYTE_COUNT_0_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		std::cerr << "Accelerator initialization failed: " << Status;
		return Status;
	}

	if (VERBOSE)
		std::cout << "\nAccelerator initialization succeeded:\n"
				<< " |  Device ID: 0x" << std::hex << AccelConfig->DeviceId
				<< std::dec << "\n" << " |  Base Address: 0x" << std::hex
				<< AccelConfig->Control_BaseAddress << std::dec << "\n";

	Status = AccelInterruptSetup();

	if (Status != XST_SUCCESS) {
		std::cerr << "Accelerator interrupt set-up failed: " << Status;
		return Status;
	}

	Status = BytecountInterruptInit();

	if (Status != XST_SUCCESS) {
		std::cerr << "Bytecount interrupt initialization failed: " << Status;
		return Status;
	}

	if (VERBOSE)
		std::cout << " |  Bytecount interrupt ready\n";

	while (!XByte_count_IsReady(&AcceleratorHandle)) {
		std::cerr << "Accelerator not ready";
		usleep(10);
	}

	std::cout << "\n== BEGIN TESTS ==\n";

	for (auto test : testFiles) {
		std::vector<uint8_t> testData;
		try {
			testData = std::vector<uint8_t>(1024);
			loadTest(test, testData);
		} catch (std::bad_alloc& e) {
			std::cerr << "Failed to test buffer: " << e.what() << "\n";
			continue;
		}

		std::cout << " |  First byte of test data: 0x" << std::hex
				<< (int) testData[0] << std::dec << "\n";
	}

	return Status;
}
