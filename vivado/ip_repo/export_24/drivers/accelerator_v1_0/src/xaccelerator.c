// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xaccelerator.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAccelerator_CfgInitialize(XAccelerator *InstancePtr, XAccelerator_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Num_blocks_BaseAddress = ConfigPtr->Num_blocks_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAccelerator_Set_num_blocks(XAccelerator *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAccelerator_WriteReg(InstancePtr->Num_blocks_BaseAddress, XACCELERATOR_NUM_BLOCKS_ADDR_NUM_BLOCKS_DATA, Data);
}

u32 XAccelerator_Get_num_blocks(XAccelerator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAccelerator_ReadReg(InstancePtr->Num_blocks_BaseAddress, XACCELERATOR_NUM_BLOCKS_ADDR_NUM_BLOCKS_DATA);
    return Data;
}

