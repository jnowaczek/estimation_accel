#include "byte_count.hpp"

result_t byte_count(data_t input[BLOCK_LENGTH]) {
#pragma HLS INTERFACE mode=s_axilite port=return
#pragma HLS INTERFACE mode=m_axi port=input offset=slave
	static count_t appearances[COUNT_BUCKETS] = { };
#pragma HLS ARRAY_PARTITION variable=appearances type=complete
	count_appearances(input, appearances);
	return count_threshold(appearances);
}

void count_appearances(data_t input[BLOCK_LENGTH], count_t *appearances) {
	APPEARANCES: for (iter_t i = 0; i < BLOCK_LENGTH; i++) {
		data_t byte = input[i];
		count_t count = appearances[byte];

		// Saturation rounding prevents overflow
		count += 1;

		appearances[byte] = count;
	}
}

result_t count_threshold(count_t *appearances) {
	result_t over_thresh = 0;

	THRESHOLD: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
		if (appearances[i] > BYTE_COUNT_THRESHOLD)
			over_thresh += 1;
	}

	return over_thresh;
}
