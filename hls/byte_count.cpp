#include <cstring>

#include "byte_count.hpp"

result_t byte_count(data_t input[BLOCK_LENGTH]) {
#pragma HLS INTERFACE mode=ap_ctrl_chain port=return
#pragma HLS interface mode=m_axi port=input offset=slave
#pragma HLS DATAFLOW

	data_t inputBuffer[BLOCK_LENGTH];
#pragma HLS ARRAY_PARTITION variable=inputBuffer type=block factor=4
	std::memcpy(inputBuffer, input, 1024 * sizeof(data_t));

	data_t* input0 = inputBuffer;
	data_t* input1 = input0 + 256 * sizeof(data_t);
	data_t* input2 = input1 + 256 * sizeof(data_t);
	data_t* input3 = input2 + 256 * sizeof(data_t);

	count_t appearances0[COUNT_BUCKETS];
	count_t appearances1[COUNT_BUCKETS];
	count_t appearances2[COUNT_BUCKETS];
	count_t appearances3[COUNT_BUCKETS];

	count_t combined_appearances[COUNT_BUCKETS];

	count_appearances(input0, appearances0);
	count_appearances(input1, appearances1);
	count_appearances(input2, appearances2);
	count_appearances(input3, appearances3);


	reduce_appearances(appearances0, appearances1, appearances2, appearances3,
			combined_appearances);

	return count_threshold(combined_appearances);
}

void clear_appearances(count_t appearances0[COUNT_BUCKETS],
		count_t appearances1[COUNT_BUCKETS],
		count_t appearances2[COUNT_BUCKETS],
		count_t appearances3[COUNT_BUCKETS]) {
	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS PIPELINE II=1
		appearances0[i] = 0;
		appearances1[i] = 0;
		appearances2[i] = 0;
		appearances3[i] = 0;
	}
}

// Heavily borrowed from https://kastner.ucsd.edu/hlsbook/ page 162 as the
// example is almost exactly what I want to do.
void count_appearances(data_t input[BLOCK_LENGTH / 4],
		count_t appearances[COUNT_BUCKETS]) {
#pragma HLS DEPENDENCE variable=appearances intra RAW false
	count_t count = 0;
	iter_t i;
	data_t byte;
	data_t prev = input[0];
	APPEARANCES: for (i = 0; i < BLOCK_LENGTH / 4; i++) {
#pragma HLS PIPELINE II=1
		byte = input[i];

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
#pragma HLS PIPELINE II=1
		combined_apperances[i] = appearances0[i] + appearances1[i]
				+ appearances2[i] + appearances3[i];
	}
}

result_t count_threshold(count_t appearances[COUNT_BUCKETS]) {
	result_t over_thresh = 0;

	THRESHOLD: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
		if (appearances[i] > BYTE_COUNT_THRESHOLD)
			over_thresh += 1;
	}

	return over_thresh;
}
