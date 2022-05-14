#pragma once

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

typedef unsigned char data_t;
typedef int count_t;
typedef int result_t;
typedef int iter_t;

// Function prototypes
int ByteCountGold(data_t input[BLOCK_LENGTH]);
