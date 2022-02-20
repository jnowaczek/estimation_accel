#include <iostream>

#include "sleep.h"

#include "xbyte_count.h"
#include "xparameters.h"

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

	if (!XByte_count_IsReady(&accel)) {
		std::cerr << "Accelerator not ready";
		return XST_DEVICE_BUSY;
	}

	XByte_count_Set_input_r(&accel, (u64) &data);
	std::cout << "INFO: Accelerator input set: 0x" << std::hex << &data << std::dec << "\n";

	XByte_count_Start(&accel);
	std::cout << "INFO: Accelerator started\n";

	while (!XByte_count_IsDone(&accel)) {
		usleep(1);
		std::cout << "INFO: Accelerator not done\n";
	}

	uint32_t result = XByte_count_Get_return(&accel);
	std::cout << "INFO: Accelerator complete";
	std::cout << "    Result: " << result <<"\n";


	return status;
}
