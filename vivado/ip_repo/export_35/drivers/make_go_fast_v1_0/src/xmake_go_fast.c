// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
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

void XMake_go_fast_Start(XMake_go_fast *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMake_go_fast_IsDone(XMake_go_fast *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMake_go_fast_IsIdle(XMake_go_fast *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMake_go_fast_IsReady(XMake_go_fast *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMake_go_fast_EnableAutoRestart(XMake_go_fast *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMake_go_fast_DisableAutoRestart(XMake_go_fast *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_AP_CTRL, 0);
}

void XMake_go_fast_InterruptGlobalEnable(XMake_go_fast *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_GIE, 1);
}

void XMake_go_fast_InterruptGlobalDisable(XMake_go_fast *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_GIE, 0);
}

void XMake_go_fast_InterruptEnable(XMake_go_fast *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IER);
    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IER, Register | Mask);
}

void XMake_go_fast_InterruptDisable(XMake_go_fast *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IER);
    XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMake_go_fast_InterruptClear(XMake_go_fast *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XMake_go_fast_WriteReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_ISR, Mask);
}

u32 XMake_go_fast_InterruptGetEnabled(XMake_go_fast *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_IER);
}

u32 XMake_go_fast_InterruptGetStatus(XMake_go_fast *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XMake_go_fast_ReadReg(InstancePtr->Control_BaseAddress, XMAKE_GO_FAST_CONTROL_ADDR_ISR);
}

