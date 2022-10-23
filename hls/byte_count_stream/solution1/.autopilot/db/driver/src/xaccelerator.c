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

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAccelerator_Start(XAccelerator *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_AP_CTRL) & 0x80;
    XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAccelerator_IsDone(XAccelerator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAccelerator_IsIdle(XAccelerator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAccelerator_IsReady(XAccelerator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAccelerator_EnableAutoRestart(XAccelerator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XAccelerator_DisableAutoRestart(XAccelerator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_AP_CTRL, 0);
}

void XAccelerator_Set_num_blocks(XAccelerator *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_NUM_BLOCKS_DATA, Data);
}

u32 XAccelerator_Get_num_blocks(XAccelerator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_NUM_BLOCKS_DATA);
    return Data;
}

void XAccelerator_InterruptGlobalEnable(XAccelerator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_GIE, 1);
}

void XAccelerator_InterruptGlobalDisable(XAccelerator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_GIE, 0);
}

void XAccelerator_InterruptEnable(XAccelerator *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_IER);
    XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_IER, Register | Mask);
}

void XAccelerator_InterruptDisable(XAccelerator *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_IER);
    XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_IER, Register & (~Mask));
}

void XAccelerator_InterruptClear(XAccelerator *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XAccelerator_WriteReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_ISR, Mask);
}

u32 XAccelerator_InterruptGetEnabled(XAccelerator *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_IER);
}

u32 XAccelerator_InterruptGetStatus(XAccelerator *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XAccelerator_ReadReg(InstancePtr->Control_BaseAddress, XACCELERATOR_CONTROL_ADDR_ISR);
}

