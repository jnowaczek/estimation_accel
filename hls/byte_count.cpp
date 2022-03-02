#include "byte_count.hpp"

result_t byte_count(data_t input[BLOCK_LENGTH]) {
#pragma HLS INTERFACE mode=s_axilite port=return
#pragma HLS INTERFACE mode=m_axi port=input offset=slave
	static count_t appearances[COUNT_BUCKETS] = { };
	count_appearances(input, appearances);
	return count_threshold(appearances);
}

// Heavily borrowed from https://kastner.ucsd.edu/hlsbook/ page 162 as the
// example is almost exactly what I want to do.
void count_appearances(data_t input[BLOCK_LENGTH],
		count_t appearances[COUNT_BUCKETS]) {
	count_t count = 0;
	iter_t i;
	data_t byte;
	data_t prev = input[0];
#pragma HLS DEPENDENCE variable=appearances intra RAW false
	APPEARANCES: for (i = 0; i < BLOCK_LENGTH; i++) {
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

result_t count_threshold(count_t *appearances) {
	result_t over_thresh = 0;

	THRESHOLD: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS PIPELINE
		if (appearances[i] > BYTE_COUNT_THRESHOLD)
			over_thresh += 1;
	}

	return over_thresh;
}
