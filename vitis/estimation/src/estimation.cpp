#include <iostream>

#include "xbyte_count.h"
#include "xparameters.h"

XByte_count accel;
XByte_count_Config *config;

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
			<< "                    █▄█ ██▄ █░▀█ █▄▄ █▀█ █░▀░█ █▀█ █▀▄ █░█\n"

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

	if (!XByte_count_IsReady(accel)) {
		std::cerr << "Accelerator not ready";
		return XST_DEVICE_BUSY;
	}

	XByte_count_Set_input_r(&accel, Data)

	return status;
}
