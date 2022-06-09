#include "byte_count.hpp"

result_t byte_count(const packed_t input[BLOCK_LENGTH / 4]) {
#pragma HLS INTERFACE mode=m_axi port=input
#pragma HLS INTERFACE mode=s_axilite port=return
#pragma HLS DATAFLOW

	data_t input0[BLOCK_LENGTH / 4];
#pragma HLS STABLE variable= input0
	data_t input1[BLOCK_LENGTH / 4];
#pragma HLS STABLE variable= input1
	data_t input2[BLOCK_LENGTH / 4];
#pragma HLS STABLE variable= input2
	data_t input3[BLOCK_LENGTH / 4];
#pragma HLS STABLE variable= input3

	count_t appearances0[COUNT_BUCKETS];
	count_t appearances1[COUNT_BUCKETS];
	count_t appearances2[COUNT_BUCKETS];
	count_t appearances3[COUNT_BUCKETS];

	count_t combined_appearances[COUNT_BUCKETS];

	result_t output = -1;

	split(input, input0, input1, input2, input3);

	count_appearances(input0, appearances0);
	count_appearances(input1, appearances1);
	count_appearances(input2, appearances2);
	count_appearances(input3, appearances3);

	reduce_appearances(appearances0, appearances1, appearances2, appearances3,
			combined_appearances);

	count_threshold(combined_appearances, output);

	return output;
}

void split(const packed_t input[BLOCK_LENGTH / 4],
		data_t output0[BLOCK_LENGTH / 4], data_t output1[BLOCK_LENGTH / 4],
		data_t output2[BLOCK_LENGTH / 4], data_t output3[BLOCK_LENGTH / 4]) {
	packed_t temp = input[0];

	for (iter_t i = 0; i < BLOCK_LENGTH / 4; i++) {
		temp = input[i];
		output0[i] = data_t(temp(7, 0));
		output1[i] = data_t(temp(15, 8));
		output2[i] = data_t(temp(23, 16));
		output3[i] = data_t(temp(31, 24));
	}
}

// Heavily borrowed from https://kastner.ucsd.edu/hlsbook/ page 162 as the
// example is almost exactly what I want to do.
void count_appearances(data_t input[BLOCK_LENGTH / 4],
		count_t appearances[COUNT_BUCKETS]) {
#pragma HLS DEPENDENCE variable=appearances intra RAW false
	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		appearances[i] = 0;
	}
	count_t count = 0;
	data_t prev = input[0];
	APPEARANCES: for (iter_t i = 0; i < BLOCK_LENGTH / 4; i++) {
#pragma HLS PIPELINE II=1
		data_t byte = input[i];

		if (prev == byte) {
			count += 1;
		} else {
			appearances[prev] = count;
			count = appearances[byte] + 1;
		}

		prev = byte;
	}
	appearances[prev] = count;
}

void reduce_appearances(count_t appearances0[COUNT_BUCKETS],
		count_t appearances1[COUNT_BUCKETS],
		count_t appearances2[COUNT_BUCKETS],
		count_t appearances3[COUNT_BUCKETS],
		count_t combined_apperances[COUNT_BUCKETS]) {
	REDUCE: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		combined_apperances[i] = appearances0[i] + appearances1[i]
				+ appearances2[i] + appearances3[i];
	}
}

void count_threshold(count_t appearances[COUNT_BUCKETS], result_t &output) {
	result_t over_thresh = 0;

	THRESHOLD: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		if (appearances[i] > BYTE_COUNT_THRESHOLD)
			over_thresh += 1;
	}

	output = over_thresh;
}
