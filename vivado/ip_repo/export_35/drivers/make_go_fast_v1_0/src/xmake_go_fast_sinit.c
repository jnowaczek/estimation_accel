// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xmake_go_fast.h"

extern XMake_go_fast_Config XMake_go_fast_ConfigTable[];

XMake_go_fast_Config *XMake_go_fast_LookupConfig(u16 DeviceId) {
	XMake_go_fast_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMAKE_GO_FAST_NUM_INSTANCES; Index++) {
		if (XMake_go_fast_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMake_go_fast_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMake_go_fast_Initialize(XMake_go_fast *InstancePtr, u16 DeviceId) {
	XMake_go_fast_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMake_go_fast_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMake_go_fast_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif
