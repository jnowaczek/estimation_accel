// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XBYTE_COUNT_H
#define XBYTE_COUNT_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xbyte_count_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XByte_count_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XByte_count;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XByte_count_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XByte_count_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XByte_count_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XByte_count_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XByte_count_Initialize(XByte_count *InstancePtr, u16 DeviceId);
XByte_count_Config* XByte_count_LookupConfig(u16 DeviceId);
int XByte_count_CfgInitialize(XByte_count *InstancePtr, XByte_count_Config *ConfigPtr);
#else
int XByte_count_Initialize(XByte_count *InstancePtr, const char* InstanceName);
int XByte_count_Release(XByte_count *InstancePtr);
#endif

void XByte_count_Start(XByte_count *InstancePtr);
u32 XByte_count_IsDone(XByte_count *InstancePtr);
u32 XByte_count_IsIdle(XByte_count *InstancePtr);
u32 XByte_count_IsReady(XByte_count *InstancePtr);
void XByte_count_EnableAutoRestart(XByte_count *InstancePtr);
void XByte_count_DisableAutoRestart(XByte_count *InstancePtr);

void XByte_count_Set_input_r(XByte_count *InstancePtr, u64 Data);
u64 XByte_count_Get_input_r(XByte_count *InstancePtr);
u32 XByte_count_Get_output_r(XByte_count *InstancePtr);
u32 XByte_count_Get_output_r_vld(XByte_count *InstancePtr);

void XByte_count_InterruptGlobalEnable(XByte_count *InstancePtr);
void XByte_count_InterruptGlobalDisable(XByte_count *InstancePtr);
void XByte_count_InterruptEnable(XByte_count *InstancePtr, u32 Mask);
void XByte_count_InterruptDisable(XByte_count *InstancePtr, u32 Mask);
void XByte_count_InterruptClear(XByte_count *InstancePtr, u32 Mask);
u32 XByte_count_InterruptGetEnabled(XByte_count *InstancePtr);
u32 XByte_count_InterruptGetStatus(XByte_count *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
