#include <iostream>

#include "ff.h"
#include "sleep.h"
#include "xbyte_count.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "xscugic.h"

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

	FIL Fil;
	FRESULT Fr;

	Fr = f_mount(&FatFs, "", 0);

	Fr = f_open(&Fil, "0:/test.txt", FA_READ | FA_WRITE);

	if (Fr != FR_OK) {
		std::cerr << "Failed to open file\n";
	}

	auto size = f_size(&Fil);
	std::cout << "File size: " << size << "\n";

	size_t bw;
	Fr = f_write(&Fil, "some stuff", 10, &bw);

	if (Fr != FR_OK) {
		std::cerr << "Failed to write to file\n";
	} else {
		std::cout << "Wrote " << bw << "bytes to file\n";
	}

	f_close(&Fil);
	f_unmount("");

	Status = XByte_count_Initialize(&AcceleratorHandle,
	XPAR_BYTE_COUNT_0_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		std::cerr << "Accelerator initialization failed: " << Status;
		return Status;
	}

	std::cout << "Accelerator initialization succeeded:\n"
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

	std::cout << "Bytecount interrupt ready\n";

	while (!XByte_count_IsReady(&AcceleratorHandle)) {
		std::cerr << "Accelerator not ready";
		usleep(10);
	}

	XByte_count_Set_input_r(&AcceleratorHandle, (u64) &data);
	std::cout << "INFO: Accelerator input set: 0x" << std::hex << &data
			<< std::dec << "\n";
	XTime_GetTime(&start_time);
	XByte_count_Start(&AcceleratorHandle);

	while (!XByte_count_IsDone(&AcceleratorHandle)) {
		usleep(10);
	}

	uint32_t result = XByte_count_Get_out_r(&AcceleratorHandle);
	std::cout << "INFO: Accelerator complete" << "\n";
	std::cout << "    Result: " << result << "\n";
	std::cout << "    Took "
			<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
			<< "μs \n";

	return Status;
}
