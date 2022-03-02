#pragma once

#include "byte_count_types.hpp"

int byte_count_gold(data_t input[BLOCK_LENGTH]) {
	int count = 0;
	int appearances[256] = {};

	for (int i = 0; i < BLOCK_LENGTH; i++) {
		appearances[input[i]] += 1;
	}

	for (auto bucket : appearances) {
		if (bucket > BYTE_COUNT_THRESHOLD) {
			count += 1;
		}
	}

	return count;
}
