#include <iostream>

#include "sleep.h"
#include "xbyte_count.h"
#include "xparameters.h"
#include "xtime_l.h"

XByte_count accel;
XByte_count_Config *config;

uint8_t data[1024] = {0};

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

	status = XByte_count_Initialize(&accel, XPAR_BYTE_COUNT_0_DEVICE_ID);

	if (status != XST_SUCCESS) {
		std::cerr << "Accelerator initialization failed: " << status;
		return status;
	}

	std::cout << "Accelerator initialization succeeded:\n"
			<< " |  Device ID: 0x" << std::hex << config->DeviceId << std::dec
			<< "\n" << " |  Base Address: 0x" << std::hex
			<< config->Control_BaseAddress << std::dec << "\n";

	while (!XByte_count_IsReady(&accel)) {
		std::cerr << "Accelerator not ready";
		sleep(1);
	}

	XTime start_time, end_time;

	XByte_count_Set_input_r(&accel, (u64) &data);
	std::cout << "INFO: Accelerator input set: 0x" << std::hex << &data << std::dec << "\n";
	XTime_GetTime(&start_time);
	XByte_count_Start(&accel);


	while (!XByte_count_IsDone(&accel)) {
		XTime_GetTime(&end_time);
	}

	uint32_t result = XByte_count_Get_out_r(&accel);
	std::cout << "INFO: Accelerator complete" << "\n";
	std::cout << "    Result: " << result << "\n";
	std::cout << "    Took " << 1.0 * (end_time - start_time) / (COUNTS_PER_SECOND / 1000000) << "μs \n";


	return status;
}
