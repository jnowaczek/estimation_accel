#pragma once

#ifdef __linux__
// Workaround mpfr.h bug preventing cosimulation
// Ref: https://support.xilinx.com/s/question/0D52E00006iHkfpSAC/vivado-20153-hls-bug-gmph
#include "/tools/Xilinx/Vitis_HLS/2021.2/include/gmp.h"
#endif

#include "ap_fixed.h"
#include "ap_int.h"

#define DATA_T_WIDTH 8
#define PACKED_T_WIDTH 32
#define RESULT_T_WIDTH 8
#define ITER_T_WIDTH 11

#define COUNT_T_WIDTH 3
#define COUNT_T_INT_WIDTH 3

#define COUNT_T_MAX 7 // (int)pow(2, COUNT_T_WIDTH) - 1

#define COUNT_BUCKETS 256 // (int)pow(2, DATA_T_WIDTH)
#define BLOCK_LENGTH 1024
#define BYTE_COUNT_THRESHOLD (BLOCK_LENGTH / 256)

//typedef ap_uint<DATA_T_WIDTH> data_t;
typedef ap_uint<PACKED_T_WIDTH> packed_t;
//// Maximum count value is 7 since we just want to count the number
//// over the threshold and the amount over the threshold doesn't matter
//typedef ap_ufixed<COUNT_T_WIDTH, COUNT_T_INT_WIDTH, AP_TRN, AP_SAT> count_t;
//typedef ap_uint<RESULT_T_WIDTH> result_t;
//typedef ap_uint<ITER_T_WIDTH> iter_t;

// Debugging types
typedef unsigned char data_t;
typedef int count_t;
typedef int result_t;
typedef int iter_t;


// Function prototypes
void split(const packed_t input[BLOCK_LENGTH / 4], data_t output0[BLOCK_LENGTH / 4],
		data_t output1[BLOCK_LENGTH / 4], data_t output2[BLOCK_LENGTH / 4], data_t output3[BLOCK_LENGTH / 4]);

void count_appearances(data_t input[BLOCK_LENGTH / 4],
		count_t appearances[COUNT_BUCKETS]);

void reduce_appearances(count_t appearances0[COUNT_BUCKETS],
		count_t appearances1[COUNT_BUCKETS],
		count_t appearances2[COUNT_BUCKETS],
		count_t appearances3[COUNT_BUCKETS],
		count_t combined_apperances[COUNT_BUCKETS]);

void count_threshold(count_t appearances[COUNT_BUCKETS], result_t &out);

void byte_count(const packed_t input[BLOCK_LENGTH / 4], result_t &out);
