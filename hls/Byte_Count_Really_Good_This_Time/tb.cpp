/*
 * Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
 * Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cstdio>
#include <fstream>

#include "accelerator.h"

#define TEST_SIZE 1024

int byte_count_gold(data_t input[BLOCK_LENGTH]) {
	int count = 0;
	int appearances[256] = { };

	for (int i = 0; i < BLOCK_LENGTH; i++) {
		appearances[input[i]] += 1;
	}

	for (auto bucket : appearances) {
		if (bucket > BLOCK_LENGTH / 256) {
			count += 1;
		}
	}

	return count;
}

int main() {
	int retval = 0;

	std::vector<std::string> paths = { "tb_data/zeros", "tb_data/count.bin", "tb_data/count_sorted.bin" };
	std::vector<char> input;

	for (std::string path : paths) {
		std::ifstream file(path, std::ios::in | std::ios::binary | std::ios::ate);

		if (file.is_open()) {
			// Get file size
			std::streampos size = file.tellg();
			input.resize(size);
			file.seekg(0, std::ios::beg);

			// Read data
			file.read(input.data(), size);
		} else {
			std::cerr << "Unable to open input file\n";
			return 1;
		}

		hls::stream<data_pkt> in("in");
		hls::stream<result_t> out("out");

		std::vector<data_t> data(input.begin(), input.end());

		// Fill test stream
		for (int i = 0; i < TEST_SIZE; i++) {
			data_pkt temp;
			temp.data = data[i];
			temp.last = (i == (TEST_SIZE - 1) ? 1 : 0);
			in.write(temp);
		}

		int expected = byte_count_gold(data.data());
		make_go_fast(in, out);
		result_t actual = out.read();

		if (actual == expected) {
			std::cout << "    *** *** *** *** \n";
			std::cout << "    Input file: " << path << "\n";
			std::cout << "    Results are good: expected == actual == " << std::to_string(actual) << "\n";
			std::cout << "    *** *** *** *** \n";
		} else {
			std::cout << "    *** *** *** *** \n";
			std::cout << "    Input file: " << path << "\n";
			std::cout << "    Mismatch: result=" << std::to_string(actual) << ", expected=" << std::to_string(expected) << "\n";
			std::cout << "    *** *** *** *** \n";
			retval = 1;
		}
	}

//		for (int i = 0; i < TEST_SIZE; i++) {
//			data_pkt temp;
//			temp.data = i;
//			temp.last = (i == (TEST_SIZE - 1) ? 1 : 0);
//			in.write(temp);
//		}
//
//		for (int i = 0; i < TEST_SIZE; i++) {
//			data_pkt temp;
//			temp.data = i * 2 + 1;
//			temp.last = (i == (TEST_SIZE - 1) ? 1 : 0);
//			software.write(temp);
//		}
//
//		make_go_fast(in, out);
//
//		for (int i = 0; i < TEST_SIZE; i++) {
//			result_t result = out.read();
//			result_t expected = software.read();
//			if (result.data != expected.data) {
//				printf("i=%d %d!=%d FAIL\n", i, result.data, expected.data);
//				return 1;
//			}
//		}
	return retval;
}

