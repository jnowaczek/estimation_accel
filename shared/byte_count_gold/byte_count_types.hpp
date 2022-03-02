#pragma once

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
