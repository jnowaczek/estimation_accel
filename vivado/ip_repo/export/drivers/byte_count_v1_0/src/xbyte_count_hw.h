// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of input_r
//        bit 31~0 - input_r[31:0] (Read/Write)
// 0x14 : Data signal of input_r
//        bit 31~0 - input_r[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of out_r
//        bit 31~0 - out_r[31:0] (Read)
// 0x20 : Control signal of out_r
//        bit 0  - out_r_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XBYTE_COUNT_CONTROL_ADDR_INPUT_R_DATA 0x10
#define XBYTE_COUNT_CONTROL_BITS_INPUT_R_DATA 64
#define XBYTE_COUNT_CONTROL_ADDR_OUT_R_DATA   0x1c
#define XBYTE_COUNT_CONTROL_BITS_OUT_R_DATA   32
#define XBYTE_COUNT_CONTROL_ADDR_OUT_R_CTRL   0x20

