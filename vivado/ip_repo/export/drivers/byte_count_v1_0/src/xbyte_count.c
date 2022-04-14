// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xbyte_count.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XByte_count_CfgInitialize(XByte_count *InstancePtr, XByte_count_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XByte_count_Set_input_r(XByte_count *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_INPUT_R_DATA, (u32)(Data));
    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_INPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XByte_count_Get_input_r(XByte_count *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_INPUT_R_DATA);
    Data += (u64)XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_INPUT_R_DATA + 4) << 32;
    return Data;
}

u32 XByte_count_Get_out_r(XByte_count *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_OUT_R_DATA);
    return Data;
}

u32 XByte_count_Get_out_r_vld(XByte_count *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_OUT_R_CTRL);
    return Data & 0x1;
}

