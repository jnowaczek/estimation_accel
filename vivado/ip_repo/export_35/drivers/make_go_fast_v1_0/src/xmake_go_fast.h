// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XMAKE_GO_FAST_H
#define XMAKE_GO_FAST_H

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
#include "xmake_go_fast_hw.h"

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
} XMake_go_fast_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMake_go_fast;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMake_go_fast_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMake_go_fast_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMake_go_fast_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMake_go_fast_ReadReg(BaseAddress, RegOffset) \
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
int XMake_go_fast_Initialize(XMake_go_fast *InstancePtr, u16 DeviceId);
XMake_go_fast_Config* XMake_go_fast_LookupConfig(u16 DeviceId);
int XMake_go_fast_CfgInitialize(XMake_go_fast *InstancePtr, XMake_go_fast_Config *ConfigPtr);
#else
int XMake_go_fast_Initialize(XMake_go_fast *InstancePtr, const char* InstanceName);
int XMake_go_fast_Release(XMake_go_fast *InstancePtr);
#endif

void XMake_go_fast_Start(XMake_go_fast *InstancePtr);
u32 XMake_go_fast_IsDone(XMake_go_fast *InstancePtr);
u32 XMake_go_fast_IsIdle(XMake_go_fast *InstancePtr);
u32 XMake_go_fast_IsReady(XMake_go_fast *InstancePtr);
void XMake_go_fast_EnableAutoRestart(XMake_go_fast *InstancePtr);
void XMake_go_fast_DisableAutoRestart(XMake_go_fast *InstancePtr);


void XMake_go_fast_InterruptGlobalEnable(XMake_go_fast *InstancePtr);
void XMake_go_fast_InterruptGlobalDisable(XMake_go_fast *InstancePtr);
void XMake_go_fast_InterruptEnable(XMake_go_fast *InstancePtr, u32 Mask);
void XMake_go_fast_InterruptDisable(XMake_go_fast *InstancePtr, u32 Mask);
void XMake_go_fast_InterruptClear(XMake_go_fast *InstancePtr, u32 Mask);
u32 XMake_go_fast_InterruptGetEnabled(XMake_go_fast *InstancePtr);
u32 XMake_go_fast_InterruptGetStatus(XMake_go_fast *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif