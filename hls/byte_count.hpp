#pragma once

#ifdef __linux__
// Workaround mpfr.h bug preventing cosimulation
// Ref: https://support.xilinx.com/s/question/0D52E00006iHkfpSAC/vivado-20153-hls-bug-gmph
#include "/tools/Xilinx/Vitis_HLS/2021.2/include/gmp.h"
#endif

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

typedef ap_uint<DATA_T_WIDTH> data_t;
// Maximum count value is 7 since we just want to count the number
// over the threshold and the amount over the threshold doesn't matter
typedef ap_ufixed<COUNT_T_WIDTH, COUNT_T_INT_WIDTH, AP_TRN, AP_SAT> count_t;
typedef ap_uint<RESULT_T_WIDTH> result_t;
typedef ap_uint<ITER_T_WIDTH> iter_t;

// Function prototypes

void split((data_t* input,
		data_t* chunk0,
		data_t* chunk1,
		data_t* chunk2,
		data_t* chunk3);

void count_appearances(data_t input[BLOCK_LENGTH / 4],
		count_t appearances[COUNT_BUCKETS]);

void reduce_appearances(count_t appearances0[COUNT_BUCKETS],
		count_t appearances1[COUNT_BUCKETS],
		count_t appearances2[COUNT_BUCKETS],
		count_t appearances3[COUNT_BUCKETS],
		count_t combined_apperances[COUNT_BUCKETS]);

result_t count_threshold(count_t appearances[COUNT_BUCKETS]);

result_t byte_count(data_t* input);
