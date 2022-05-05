#include <iostream>

#include "sleep.h"
#include "xbyte_count.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "xscugic.h"

XScuGic InterruptController;
XScuGic_Config *GicConfig;

XByte_count AcceleratorHandle;
XByte_count_Config *AccelConfig;

uint8_t data[1024] = {0};

XTime start_time, end_time;


void AccelInterruptHandler(void *InstancePtr) {
	XTime_GetTime(&end_time);
	auto IntIDFull = XScuGic_CPUReadReg(&InterruptController, XSCUGIC_INT_ACK_OFFSET);
	XScuGic_CPUWriteReg(&InterruptController, XSCUGIC_EOI_OFFSET, IntIDFull);
}

int SetUpInterruptSystem(XScuGic *XScuGicInstancePtr)
{

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
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

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
	Status = XScuGic_Connect(&InterruptController, XPAR_FABRIC_BYTE_COUNT_0_INTERRUPT_INTR,
			   (Xil_ExceptionHandler)AccelInterruptHandler,
			   (void *)&InterruptController);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the device
	 */
	XScuGic_Enable(&InterruptController, XPAR_FABRIC_BYTE_COUNT_0_INTERRUPT_INTR);

	return XST_SUCCESS;
}

int BytecountInterruptInit() {
	XByte_count_DisableAutoRestart(&AcceleratorHandle);
	// Interrupt 0 is ap_done, interrupt 1 is ap_ready
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

	int status;

	status = XByte_count_Initialize(&AcceleratorHandle, XPAR_BYTE_COUNT_0_DEVICE_ID);

	if (status != XST_SUCCESS) {
		std::cerr << "Accelerator initialization failed: " << status;
		return status;
	}

	std::cout << "Accelerator initialization succeeded:\n"
			<< " |  Device ID: 0x" << std::hex << AccelConfig->DeviceId << std::dec
			<< "\n" << " |  Base Address: 0x" << std::hex
			<< AccelConfig->Control_BaseAddress << std::dec << "\n";

	status = AccelInterruptSetup();

	if (status != XST_SUCCESS) {
		std::cerr << "Accelerator interrupt set-up failed: " << status;
		return status;
	}

	status = BytecountInterruptInit();

	if (status != XST_SUCCESS) {
		std::cerr << "Bytecount interrupt initialization failed: " << status;
		return status;
	}

	std::cout << "Bytecount interrupt ready\n";

	while (!XByte_count_IsReady(&AcceleratorHandle)) {
		std::cerr << "Accelerator not ready";
		sleep(1);
	}

	std::cout << "Did interrupt trigger: " << XByte_count_InterruptGetStatus(&AcceleratorHandle) << "\n";


	XByte_count_Set_input_r(&AcceleratorHandle, (u64) &data);
	std::cout << "INFO: Accelerator input set: 0x" << std::hex << &data << std::dec << "\n";
	XTime_GetTime(&start_time);
	XByte_count_Start(&AcceleratorHandle);


	while (!XByte_count_IsDone(&AcceleratorHandle)) {
		usleep(10);
	}

	uint32_t result = XByte_count_Get_out_r(&AcceleratorHandle);
	std::cout << "INFO: Accelerator complete" << "\n";
	std::cout << "    Result: " << result << "\n";
	std::cout << "    Took " << 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000) << "μs \n";

	std::cout << "Did interrupt trigger: " << XByte_count_InterruptGetStatus(&AcceleratorHandle) << "\n";

	return status;
}
