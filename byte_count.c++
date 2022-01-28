#include "byte_count.hpp"

namespace bytecount {

result_t byte_count(data_t input[BLOCK_LENGTH]) {
	count_t* appearances;
	appearances = count_appearances(input);
	return count_threshold(appearances);
}

count_t* count_appearances(data_t input[BLOCK_LENGTH]) {
	static count_t appearances[COUNT_BUCKETS] = { };
#pragma HLS ARRAY_PARTITION variable=appearances type=complete

	APPEARANCES: for (iter_t i = 0; i < BLOCK_LENGTH; i++) {
#pragma HLS UNROLL factor=8
#pragma HLS PIPELINE rewind
		data_t byte = input[i];
		count_t count = appearances[byte];

		// Is this an optimization? Need to check with simulation.
		if (count < COUNT_T_MAX)
			appearances[byte] += 1;
	}

	return appearances;
}

result_t count_threshold(count_t* appearances) {
	result_t over_thresh = 0;

	THRESHOLD: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		if (appearances[i] > BYTE_COUNT_THRESHOLD)
			over_thresh += 1;
	}

	return over_thresh;
}

}

//int byte_count(std::vector<uint8_t> input) {
//	int count = 0;
//	std::array<int, 256> appearances;
//	const int threshold = input.size() / 256;
//
//	for (int i = 0; i < input.size(); i++) {
//		appearances[input[i]] += 1;
//	}
//
//	for (auto bucket : appearances) {
//		if (bucket > threshold) {
//			count += 1;
//		}
//	}
//
//	return count;
//}
