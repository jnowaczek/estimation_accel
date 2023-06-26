#pragma once

#ifdef __linux__
// Workaround mpfr.h bug preventing cosimulation
// Ref: https://support.xilinx.com/s/question/0D52E00006iHkfpSAC/vivado-20153-hls-bug-gmph
#include "/tools/Xilinx/Vitis_HLS/2021.2/include/gmp.h"
#endif

#include "ap_axi_sdata.h"
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"

#define DATA_T_WIDTH 8
#define RESULT_T_WIDTH 8
#define ITER_T_WIDTH 11

#define COUNT_T_WIDTH 3
#define COUNT_T_INT_WIDTH 3

#define COUNT_T_MAX 7 // (int)pow(2, COUNT_T_WIDTH) - 1

#define COUNT_BUCKETS 256 // (int)pow(2, DATA_T_WIDTH)
#define BLOCK_LENGTH 1024
#define BYTE_COUNT_THRESHOLD (BLOCK_LENGTH / 256)

//typedef ap_uint<DATA_T_WIDTH> data_t;
//typedef ap_uint<PACKED_T_WIDTH> packed_t;
// Maximum count value is 7 since we just want to count the number
// over the threshold and the amount over the threshold doesn't matter
typedef ap_ufixed<COUNT_T_WIDTH, COUNT_T_INT_WIDTH, AP_TRN, AP_SAT> count_t;
//typedef ap_uint<RESULT_T_WIDTH> result_t;
//typedef ap_uint<ITER_T_WIDTH> iter_t;

// Debugging types
typedef unsigned char data_t;
//typedef int count_t;
typedef int result_t;
typedef int iter_t;

typedef ap_axiu<DATA_T_WIDTH, 1, 1, 1> in_pkt;
typedef ap_axiu<RESULT_T_WIDTH, 1, 1, 1> out_pkt;

// Function prototypes
void count(hls::stream<data_t> &in, count_t appear[COUNT_BUCKETS]);

void threshold(count_t appear[BLOCK_LENGTH], hls::stream<out_pkt> &out, bool last_block);

void accelerator(hls::stream<data_t> &In, hls::stream<out_pkt> &Out, unsigned int num_blocks);
