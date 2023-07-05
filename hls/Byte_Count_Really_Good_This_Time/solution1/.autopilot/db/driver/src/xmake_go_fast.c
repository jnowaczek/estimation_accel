// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xmake_go_fast.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMake_go_fast_CfgInitialize(XMake_go_fast *InstancePtr, XMake_go_fast_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMake_go_fast_Set_in_r(XMake_go_fast *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IN_R_DATA, (u32)(Data));
    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IN_R_DATA + 4, (u32)(Data >> 32));
}

u64 XMake_go_fast_Get_in_r(XMake_go_fast *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IN_R_DATA);
    Data += (u64)XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IN_R_DATA + 4) << 32;
    return Data;
}

void XMake_go_fast_Set_out_r(XMake_go_fast *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_OUT_R_DATA, (u32)(Data));
    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_OUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XMake_go_fast_Get_out_r(XMake_go_fast *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_OUT_R_DATA);
    Data += (u64)XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_OUT_R_DATA + 4) << 32;
    return Data;
}

