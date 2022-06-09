// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
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

void XByte_count_Start(XByte_count *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_AP_CTRL) & 0x80;
    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XByte_count_IsDone(XByte_count *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XByte_count_IsIdle(XByte_count *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XByte_count_IsReady(XByte_count *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XByte_count_EnableAutoRestart(XByte_count *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XByte_count_DisableAutoRestart(XByte_count *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_AP_CTRL, 0);
}

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

u32 XByte_count_Get_output_r(XByte_count *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_OUTPUT_R_DATA);
    return Data;
}

u32 XByte_count_Get_output_r_vld(XByte_count *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_OUTPUT_R_CTRL);
    return Data & 0x1;
}

void XByte_count_InterruptGlobalEnable(XByte_count *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_GIE, 1);
}

void XByte_count_InterruptGlobalDisable(XByte_count *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_GIE, 0);
}

void XByte_count_InterruptEnable(XByte_count *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_IER);
    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_IER, Register | Mask);
}

void XByte_count_InterruptDisable(XByte_count *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_IER);
    XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_IER, Register & (~Mask));
}

void XByte_count_InterruptClear(XByte_count *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XByte_count_WriteReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_ISR, Mask);
}

u32 XByte_count_InterruptGetEnabled(XByte_count *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_IER);
}

u32 XByte_count_InterruptGetStatus(XByte_count *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XByte_count_ReadReg(InstancePtr->Control_BaseAddress, XBYTE_COUNT_CONTROL_ADDR_ISR);
}

