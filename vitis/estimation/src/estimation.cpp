#include <iostream>
#include <memory>
#include <string.h>
#include <vector>

#include "ff.h"
#include "sleep.h"
#include "xaxidma.h"
#include "xaccelerator.h"
#include "xdebug.h"
#include "xparameters.h"
#include "xtime_l.h"
#include "xscugic.h"
#include "xil_exception.h"

#include "CardIO.hpp"
#include "ByteCountGold.hpp"

#ifndef VERBOSE
// Default to verbose mode
#define VERBOSE 1
#endif

#define DMA_TX_INTR_ID XPAR_FABRIC_CONCAT_INTR_0_INTR_OUT_0_INTR
#define DMA_RX_INTR_ID XPAR_FABRIC_CONCAT_INTR_0_INTR_OUT_1_INTR

// AXI DMA driver
XAxiDma AxiDma;
XAxiDma_Config *AxiDmaConfig;

// Interrupt controller driver
XScuGic InterruptController;
XScuGic_Config *GicConfig;

// Accelerator driver
XAccelerator AcceleratorHandle;
XAccelerator_Config *AccelConfig;

// Filesystem driver
FATFS FatFs;

// Timing
XTime start_time;
XTime volatile end_time;

/*****************************************************************************/
/*
 *
 * This is the DMA TX Interrupt handler function.
 *
 * It gets the interrupt status from the hardware, acknowledges it, and if any
 * error happens, it resets the hardware. Otherwise, if a completion interrupt
 * is present, then sets the TxDone.flag
 *
 * @param	Callback is a pointer to TX channel of the DMA engine.
 *
 * @return	None.
 *
 * @note		None.
 *
 ******************************************************************************/
static void TxIntrHandler(void *Callback) {

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *) Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);

	/* Acknowledge pending interrupts */

	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DMA_TO_DEVICE);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {

		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		int Error = 1;

		/*
		 * Reset should never fail for transmit channel
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = 10000;

		while (TimeOut) {
			if (XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If Completion interrupt is asserted, then set the TxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		int TxDone = 1;
	}
}

/*****************************************************************************/
/*
 *
 * This is the DMA RX interrupt handler function
 *
 * It gets the interrupt status from the hardware, acknowledges it, and if any
 * error happens, it resets the hardware. Otherwise, if a completion interrupt
 * is present, then it sets the RxDone flag.
 *
 * @param	Callback is a pointer to RX channel of the DMA engine.
 *
 * @return	None.
 *
 * @note		None.
 *
 ******************************************************************************/
static void RxIntrHandler(void *Callback) {
	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *) Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		int Error = 1;

		/* Reset could fail and hang
		 * NEED a way to handle this or do not call it??
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = 10000;

		while (TimeOut) {
			if (XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If completion interrupt is asserted, then set RxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		int RxDone = 1;
	}
}

///*
// * Accelerator Done interrupt handler
// */
//void AccelDoneInterruptHandler(void *InstancePtr) {
//	XTime_GetTime(const_cast<XTime*>(&end_time));
//
//	// Clear ISR
//	XByte_count_InterruptGetStatus(&AcceleratorHandle);
//}

/*
 * Configure PS interrupt controller
 * Borrowed from Xilinx example:
 * https://github.com/Xilinx/embeddedsw/blob/master/XilinxProcessorIPLib/drivers/scugic/examples/xscugic_example.c
 */
int PsInterruptSetup(XScuGic *XScuGicInstancePtr) {

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
 * Adapted from Xilinx example SetupIntrSystem():
 * https://github.com/Xilinx/embeddedsw/blob/master/XilinxProcessorIPLib/drivers/axidma/examples/xaxidma_example_simple_intr.c
 */
int PlInterruptSetup() {
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
	 * Setup the PS Interrupt System
	 */
	Status = PsInterruptSetup(&InterruptController);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(&InterruptController, DMA_TX_INTR_ID, 0xA0,
			0x3);
	XScuGic_SetPriorityTriggerType(&InterruptController, DMA_RX_INTR_ID, 0xA0,
			0x3);

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler performs
	 * the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(&InterruptController, DMA_TX_INTR_ID,
			(Xil_InterruptHandler) TxIntrHandler, &AxiDma);

	if (Status != XST_SUCCESS) {
		return Status;
	}
	Status = XScuGic_Connect(&InterruptController, DMA_RX_INTR_ID,
			(Xil_InterruptHandler) RxIntrHandler, &AxiDma);

	if (Status != XST_SUCCESS) {
		return Status;
	}

	/*
	 * Enable the interrupt for the device
	 */
	XScuGic_Enable(&InterruptController, DMA_TX_INTR_ID);
	XScuGic_Enable(&InterruptController, DMA_RX_INTR_ID);

	/* Enable interrupts from the hardware */

	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler,
			(void *) &InterruptController);

	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

int DmaSetup() {
	int Status;

	AxiDmaConfig = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if (!AxiDmaConfig) {
		xil_printf("No config found for %d\r\n", XPAR_AXIDMA_0_DEVICE_ID);

		return XST_FAILURE;
	}

	/* Initialize DMA engine */
	Status = XAxiDma_CfgInitialize(&AxiDma, AxiDmaConfig);

	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", Status);
		return Status;
	}

	if (XAxiDma_HasSg(&AxiDma)) {
		xil_printf("Device configured in Scatter-Gather mode \r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

FRESULT initializeFS() {
	return f_mount(&FatFs, "", 0);
}

FRESULT cleanupFS() {
	return f_unmount("");
}

int main(void) {
	std::cout << " _______________\n";
	std::cout << "/ Compression   \\\n";
	std::cout << "|  Estimation   |\n";
	std::cout << "|   Accelerator |\n";
	std::cout << "\\    Benchmark  /\n";
	std::cout << " ---------------\n";
	std::cout << "        \\   ^__^\n";
	std::cout << "         \\  (oo)\\_______\n";
	std::cout << "            (__)\\       )\\/\\\n";
	std::cout << "                ||----w |\n";
	std::cout << "                ||     ||\n";

	int Status;

	FRESULT Fr;

	Fr = initializeFS();
	if (Fr != FR_OK) {
		std::cerr << "Failed to mount filesystem\n";
	}

	std::vector<std::string> testFiles;
	listTests("/test_data", testFiles);

	std::cout << "\n== INDEXING TEST DATA ==\n\n";

	std::cout << "Indexed " << testFiles.size() << " test files\n";
	if (VERBOSE) {
		for (std::string file : testFiles) {
			std::cout << " |  " << file << "\n";
		}
	}

	std::cout << "\n== CONFIGURING DEVICE ==\n\n";

	Status = XAccelerator_Initialize(&AcceleratorHandle,
	XPAR_ACCELERATOR_0_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		std::cerr << "Accelerator initialization failed: " << Status;
		return Status;
	}

	std::cout << "Accelerator initialization succeeded\n";
	if (VERBOSE) {
		std::cout << " |  Device ID: 0x" << std::hex << AccelConfig->DeviceId
				<< std::dec << "\n";
		std::cout << " |  Base Address: 0x" << std::hex
				<< AccelConfig->Control_BaseAddress << std::dec << "\n";
	}

	Status = DmaSetup();

	if (Status != XST_SUCCESS) {
		std::cerr << "DMA setup failed: " << Status;
		return Status;
	}

	std::cout << "\nDMA setup succeeded\n";
	if (VERBOSE) {
		std::cout << " | " << AxiDmaConfig->Mm2sNumChannels
				<< " MM2S channel(s), " << AxiDmaConfig->Mm2SDataWidth
				<< "b wide, " << AxiDmaConfig->Mm2SBurstSize
				<< " word max burst size\n" << " | "
				<< AxiDmaConfig->S2MmNumChannels << " S2MM channel(s), "
				<< AxiDmaConfig->S2MmDataWidth << "b wide, "
				<< AxiDmaConfig->S2MmBurstSize << " word max burst size\n";
	}

	Status = PlInterruptSetup();

	if (Status != XST_SUCCESS) {
		std::cerr << "Interrupt set-up failed: " << Status;
		return Status;
	}

	XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

//	while (!XByte_count_IsReady(&AcceleratorHandle)) {
//		std::cerr << "Accelerator not ready";
//		usleep(10);
//	}

	std::cout << "\n== BEGIN TESTS ==\n\n";

	for (std::string test : testFiles) {
		alignedDataVector_t testData;
		alignedDataVector_t result;
		try {
			testData = alignedDataVector_t(1024);
			loadTest(test, testData);
		} catch (std::bad_alloc& e) {
			std::cerr << "Failed to allocate test buffer: " << e.what() << "\n";
			continue;
		}

		if (VERBOSE == 1) {
			std::cout << " |  First byte of test data: 0x" << std::hex
					<< (int) testData[0] << std::dec << "\n";
		}

		Status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR) testData.data(), 1024,
				XAXIDMA_DEVICE_TO_DMA);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) &result,
					1024, XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		XAccelerator_Set_num_blocks(&AcceleratorHandle, 1);
		XTime_GetTime(&start_time);
		XAccelerator_Start(&AcceleratorHandle);

		while (!XAccelerator_IsDone(&AcceleratorHandle))
			usleep(10);
		std::cout << "\nAccelerator complete" << "\n";
		std::cout << " |  Result = " << result[0] << "\n";
		std::cout << " |  Took "
				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
				<< "μs \n";
//
//		XTime_GetTime(&start_time);
//		int softwareResult = ByteCountGold(testData.data());
//		XTime_GetTime(const_cast<XTime*>(&end_time));
//		std::cout << "\nSoftware complete" << "\n";
//		std::cout << " |  Result = " << softwareResult << "\n";
//		std::cout << " |  Took "
//				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
//				<< "μs \n\n";
	}

	Fr = cleanupFS();
	if (Fr != FR_OK)
		std::cerr << "Error unmounting filesystem: " << Fr << "\n";

	return Status;
}
