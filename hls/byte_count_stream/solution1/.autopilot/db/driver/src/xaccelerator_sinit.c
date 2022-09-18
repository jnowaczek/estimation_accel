// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xaccelerator.h"

extern XAccelerator_Config XAccelerator_ConfigTable[];

XAccelerator_Config *XAccelerator_LookupConfig(u16 DeviceId) {
	XAccelerator_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XACCELERATOR_NUM_INSTANCES; Index++) {
		if (XAccelerator_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAccelerator_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAccelerator_Initialize(XAccelerator *InstancePtr, u16 DeviceId) {
	XAccelerator_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAccelerator_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAccelerator_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

