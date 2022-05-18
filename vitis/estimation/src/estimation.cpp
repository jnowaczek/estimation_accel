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
#include "ByteCountGold.hpp"

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
//uint8_t data[1024] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
//		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
//		35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52,
//		53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
//		71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88,
//		89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104,
//		105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118,
//		119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132,
//		133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146,
//		147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160,
//		161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174,
//		175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188,
//		189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202,
//		203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216,
//		217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230,
//		231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244,
//		245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 0, 1, 2, 3, 4, 5,
//		6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
//		25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
//		43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
//		61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78,
//		79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96,
//		97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
//		112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125,
//		126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
//		140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153,
//		154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167,
//		168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181,
//		182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195,
//		196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209,
//		210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223,
//		224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237,
//		238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251,
//		252, 253, 254, 255, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
//		15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
//		33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
//		51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68,
//		69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86,
//		87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103,
//		104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117,
//		118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131,
//		132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145,
//		146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159,
//		160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173,
//		174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187,
//		188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201,
//		202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215,
//		216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229,
//		230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243,
//		244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 0, 1, 2, 3,
//		4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
//		23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
//		41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
//		59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76,
//		77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94,
//		95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
//		110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123,
//		124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137,
//		138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151,
//		152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165,
//		166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179,
//		180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193,
//		194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207,
//		208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221,
//		222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235,
//		236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249,
//		250, 251, 252, 253, 254, 255 };

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

//	std::vector<std::string> testFiles;
//	listTests("/test_data", testFiles);

//	std::cout << "\nIndexed " << testFiles.size() << " test files\n";
//	if (VERBOSE == 1) {
//		for (auto file : testFiles) {
//			std::cout << " |  " << file << "\n";
//		}
//	}

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

//	for (int i = 0; i < 3; i++) {
//
//		XByte_count_Set_input_r(&AcceleratorHandle, (u64) data);
//		while (!XByte_count_IsReady(&AcceleratorHandle))
//			usleep(10);
//		XTime_GetTime(&start_time);
//		XByte_count_Start(&AcceleratorHandle);
//
//		result_t result;
//		while (!XByte_count_IsDone(&AcceleratorHandle))
//			usleep(10);
//		result = XByte_count_Get_return(&AcceleratorHandle);
//
//		std::cout << std::hex << XByte_count_Get_input_r(&AcceleratorHandle)
//				<< "\n";
//		std::cout << (u64) data << std::dec << "\n";
//
//		std::cout << "\nAccelerator complete" << "\n";
//		std::cout << " |  Result = " << result << "\n";
//		std::cout << " |  Took "
//				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
//				<< "μs \n";
//
//		XTime_GetTime(&start_time);
//		int softwareResult = ByteCountGold(data);
//		XTime_GetTime(&end_time);
//		std::cout << "\nSoftware complete" << "\n";
//		std::cout << " |  Result = " << softwareResult << "\n";
//		std::cout << " |  Took "
//				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
//				<< "μs \n\n";
//	}

	std::vector<uint8_t> testData = std::vector<uint8_t>(1024);
	loadTest("0:/test_data/hls_testbench/count.bin", testData);
	uint32_t* packedData = reinterpret_cast<uint32_t*>(&testData[0]);

	for (int i = 0; i < 1; i++) {

		XByte_count_Set_input_r(&AcceleratorHandle, (u64) packedData);
//		while (!XByte_count_IsReady(&AcceleratorHandle))
//			usleep(10);
//		XTime_GetTime(&start_time);
//		XByte_count_Start(&AcceleratorHandle);

//		result_t result;
//		while (!XByte_count_IsDone(&AcceleratorHandle))
//			usleep(10);
//		result = XByte_count_Get_return(&AcceleratorHandle);

//		std::cout << std::hex << XByte_count_Get_input_r(&AcceleratorHandle)
//				<< "\n";
//		std::cout << (u64) testData.data() << std::dec << "\n";
//
//		std::cout << "\nAccelerator complete" << "\n";
//		std::cout << " |  Result = " << result << "\n";
//		std::cout << " |  Took "
//				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
//				<< "μs \n";

		XTime_GetTime(&start_time);
		int softwareResult = ByteCountGold(testData.data());
		XTime_GetTime(&end_time);
		std::cout << "\nSoftware complete" << "\n";
		std::cout << " |  Result = " << softwareResult << "\n";
		std::cout << " |  Took "
				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
				<< "μs \n\n";
	}

	testData = std::vector<uint8_t>(1024);
	loadTest("0:/test_data/cantrbry/asyoulik.txt", testData);
	packedData = reinterpret_cast<uint32_t*>(&testData[0]);

	for (int i = 0; i < 3; i++) {

		XByte_count_Set_input_r(&AcceleratorHandle, (u64) packedData);
		while (!XByte_count_IsReady(&AcceleratorHandle))
			usleep(10);
		XTime_GetTime(&start_time);
		XByte_count_Start(&AcceleratorHandle);

		result_t result;
		while (!XByte_count_IsDone(&AcceleratorHandle))
			usleep(10);
		result = XByte_count_Get_return(&AcceleratorHandle);

		std::cout << std::hex << XByte_count_Get_input_r(&AcceleratorHandle)
				<< "\n";
		std::cout << (u64) testData.data() << std::dec << "\n";

		std::cout << "\nAccelerator complete" << "\n";
		std::cout << " |  Result = " << result << "\n";
		std::cout << " |  Took "
				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
				<< "μs \n";

		XTime_GetTime(&start_time);
		int softwareResult = ByteCountGold(testData.data());
		XTime_GetTime(&end_time);
		std::cout << "\nSoftware complete" << "\n";
		std::cout << " |  Result = " << softwareResult << "\n";
		std::cout << " |  Took "
				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
				<< "μs \n\n";
	}

	testData = std::vector<uint8_t>(1024);
	loadTest("0:/test_data/cantrbry/plrabn12.txt", testData);
	packedData = reinterpret_cast<uint32_t*>(&testData[0]);

	for (int i = 0; i < 3; i++) {

		XByte_count_Set_input_r(&AcceleratorHandle, (u64) packedData);
		while (!XByte_count_IsReady(&AcceleratorHandle))
			usleep(10);
		XTime_GetTime(&start_time);
		XByte_count_Start(&AcceleratorHandle);

		result_t result;
		while (!XByte_count_IsDone(&AcceleratorHandle))
			usleep(10);
		result = XByte_count_Get_return(&AcceleratorHandle);

		std::cout << std::hex << XByte_count_Get_input_r(&AcceleratorHandle)
				<< "\n";
		std::cout << (u64) testData.data() << std::dec << "\n";

		std::cout << "\nAccelerator complete" << "\n";
		std::cout << " |  Result = " << result << "\n";
		std::cout << " |  Took "
				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
				<< "μs \n";

		XTime_GetTime(&start_time);
		int softwareResult = ByteCountGold(testData.data());
		XTime_GetTime(&end_time);
		std::cout << "\nSoftware complete" << "\n";
		std::cout << " |  Result = " << softwareResult << "\n";
		std::cout << " |  Took "
				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
				<< "μs \n\n";
	}

//	for (auto test : testFiles) {
//		std::vector<uint8_t> testData;
//		try {
//			testData = std::vector<uint8_t>(1024);
//			loadTest(test, testData);
//		} catch (std::bad_alloc& e) {
//			std::cerr << "Failed to test buffer: " << e.what() << "\n";
//			continue;
//		}
//
//		std::cout << " |  First byte of test data: 0x" << std::hex
//				<< (int) testData[0] << std::dec << "\n";
//
//		while (!XByte_count_IsReady(&AcceleratorHandle)) {
//			std::cerr << "Accelerator not ready";
//			usleep(10);
//		}
//
//		std::vector<uint8_t> truncatedData = std::vector<uint8_t>(
//				testData.begin(), testData.begin() + BLOCK_LENGTH);
//
//		XByte_count_Set_input_r(&AcceleratorHandle, (u64) data);
//		XTime_GetTime(&start_time);
//		XByte_count_Start(&AcceleratorHandle);
//
//		uint32_t result;
//		while (!XByte_count_Get_out_r_vld(&AcceleratorHandle))
//			usleep(10);
//		result = XByte_count_Get_out_r(&AcceleratorHandle);
//		std::cout << "\nAccelerator complete" << "\n";
//		std::cout << " |  Result = " << result << "\n";
//		std::cout << " |  Took "
//				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
//				<< "μs \n";
//
//		XTime_GetTime(&start_time);
//		int softwareResult = ByteCountGold(data);
//		XTime_GetTime(&end_time);
//		std::cout << "\nSoftware complete" << "\n";
//		std::cout << " |  Result = " << softwareResult << "\n";
//		std::cout << " |  Took "
//				<< 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000)
//				<< "μs \n\n";
//
//		sleep(2);
//	}

	Fr = cleanupFS();
	if (Fr != FR_OK)
		std::cerr << "Error unmounting filesystem: " << Fr << "\n";

	return Status;
}
