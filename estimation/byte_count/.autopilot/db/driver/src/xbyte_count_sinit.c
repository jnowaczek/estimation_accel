// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xbyte_count.h"

extern XByte_count_Config XByte_count_ConfigTable[];

XByte_count_Config *XByte_count_LookupConfig(u16 DeviceId) {
	XByte_count_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBYTE_COUNT_NUM_INSTANCES; Index++) {
		if (XByte_count_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XByte_count_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XByte_count_Initialize(XByte_count *InstancePtr, u16 DeviceId) {
	XByte_count_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XByte_count_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XByte_count_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

