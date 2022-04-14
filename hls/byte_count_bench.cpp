#include <array>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "byte_count.hpp"

int byte_count_gold(data_t input[BLOCK_LENGTH]) {
	int count = 0;
	int appearances[256] = { };

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

int main() {
	int retval = 0;

	std::vector<std::string> paths = {"tb_data/zeros", "tb_data/count.bin", "tb_data/count_sorted.bin"};
	std::vector<char> input;

	for (std::string path : paths) {
		std::ifstream file(path,
					std::ios::in | std::ios::binary | std::ios::ate);

			if (file.is_open()) {
				std::streampos size = file.tellg();
				input.resize(size);
				file.seekg(0, std::ios::beg);
		//		file.read(input.data(), size);
				file.read(input.data(), BLOCK_LENGTH);
			} else {
				std::cerr << "Unable to open input file\n";
				return 1;
			}

			std::vector<data_t> data(input.begin(), input.end());
			const packed_t *packed_data = reinterpret_cast<packed_t*>(&data[0]);
//			std::vector<data_t> data0(input.begin(), input.begin() + BLOCK_LENGTH / 4);
//			std::vector<data_t> data1(input.begin() + BLOCK_LENGTH / 4,
//					input.begin() + BLOCK_LENGTH / 2);
//			std::vector<data_t> data2(input.begin() + BLOCK_LENGTH / 2,
//					input.end() - BLOCK_LENGTH / 4);
//			std::vector<data_t> data3(input.end() - BLOCK_LENGTH / 4, input.end());

			int expected = byte_count_gold(data.data());
			result_t actual;
			byte_count(packed_data, actual);

			if (actual == expected) {
				std::cout << "    *** *** *** *** \n";
				std::cout << "    Input file: " << path << "\n";
				std::cout << "    Results are good: expected == actual == " << actual
						<< "\n";
				std::cout << "    *** *** *** *** \n";
			} else {
				std::cout << "    *** *** *** *** \n";
				std::cout << "    Input file: " << path << "\n";
				std::cout << "    Mismatch: result=" << actual << ", expected="
						<< expected << "\n";
				std::cout << "    *** *** *** *** \n";
				retval = 2;
			}
	}

	return retval;
}
