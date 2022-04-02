#pragma once

#ifdef __linux__
// Workaround mpfr.h bug preventing cosimulation
// Ref: https://support.xilinx.com/s/question/0D52E00006iHkfpSAC/vivado-20153-hls-bug-gmph
#include "/tools/Xilinx/Vitis_HLS/2021.2/include/gmp.h"
#endif

#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"

#define WORKER_COUNT 1

#define DATA_T_WIDTH 8
#define RESULT_T_WIDTH 8
#define ITER_T_WIDTH 11

#define COUNT_T_WIDTH 3
#define COUNT_T_INT_WIDTH 3

#define COUNT_T_MAX 7 // (int)pow(2, COUNT_T_WIDTH) - 1

#define COUNT_BUCKETS 256 // (int)pow(2, DATA_T_WIDTH)
#define INPUT_SIZE 1024
#define BLOCK_SIZE (INPUT_SIZE / WORKER_COUNT)
#define BYTE_COUNT_THRESHOLD (INPUT_SIZE / COUNT_BUCKETS)

typedef ap_uint<DATA_T_WIDTH> data_t;
// Maximum count value is 7 since we just want to count the number
// over the threshold and the amount over the threshold doesn't matter
typedef ap_ufixed<COUNT_T_WIDTH, COUNT_T_INT_WIDTH, AP_TRN, AP_SAT> count_t;
typedef ap_uint<RESULT_T_WIDTH> result_t;
//typedef ap_uint<ITER_T_WIDTH> iter_t;

//// Debugging types
//typedef unsigned char data_t;
//typedef unsigned short count_t;
//typedef int result_t;
typedef int iter_t;

typedef struct {
	data_t a[BLOCK_SIZE] = {0};
} block_t;

typedef struct {
	count_t a[COUNT_BUCKETS] = {0};
} count_block_t;

// Function prototypes
void count_appearances(data_t input[INPUT_SIZE / 4],
		count_t appearances[COUNT_BUCKETS]);

void reduce_appearances(count_t appearances[WORKER_COUNT][COUNT_BUCKETS], count_t combined_apperances[COUNT_BUCKETS]);

void reduce_streaming(hls::stream<count_block_t> &input, hls::stream<count_block_t> &output);

void count_streaming(hls::stream<block_t> &input, hls::stream<count_block_t> &output);

void count_threshold(count_t appearances[COUNT_BUCKETS], hls::stream<result_t> &output);

void threshold_streaming(hls::stream<count_block_t> &input, hls::stream<result_t> &output);

void byte_count(hls::stream<block_t> &input, hls::stream<result_t> &out);

