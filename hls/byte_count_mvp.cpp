#include "byte_count_mvp.hpp"

void byte_count(data_t *input, result_t &output) {
#pragma HLS INTERFACE mode=m_axi port=input offset=slave
#pragma HLS INTERFACE mode=s_axilite port=output
#pragma HLS INTERFACE mode=s_axilite port=return
#pragma HLS DATAFLOW

	count_t appearances[COUNT_BUCKETS];

	count_appearances(input, appearances);
	count_threshold(appearances, output);
}

// Heavily borrowed from https://kastner.ucsd.edu/hlsbook/ page 162 as the
// example is almost exactly what I want to do.
void count_appearances(data_t *input, count_t appearances[COUNT_BUCKETS]) {
#pragma HLS DEPENDENCE variable=appearances intra RAW false

	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		appearances[i] = 0;
	}

	count_t count = 0;
	data_t prev = input[0];

	APPEARANCES: for (iter_t i = 0; i < BLOCK_LENGTH; i++) {
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

void count_threshold(count_t appearances[COUNT_BUCKETS], result_t &output) {
	result_t over_thresh = 0;

	THRESHOLD: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		if (appearances[i] > BYTE_COUNT_THRESHOLD)
			over_thresh += 1;
	}

	output = over_thresh;
}
