#include "byte_count.hpp"

namespace bytecount {

result_t byte_count(data_t input[]) {
	static count_t appearances[COUNT_BUCKETS] = { };

	count_appearances(input, appearances);
	return count_threshold(appearances);
}

void count_appearances(data_t input[], count_t appearances[]) {
	for (int i = 0; i < BLOCK_LENGTH; i++) {
		data_t byte = input[i];
		count_t count = appearances[byte];

		// Is this an optimization? Need to check with simulation.
		if (count < COUNT_T_MAX)
			appearances[byte] += 1;
	}
}

result_t count_threshold(count_t appearances[]) {
	result_t over_thresh;

	for (int i = 0; i < COUNT_BUCKETS; i++) {
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
