#include <array>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "byte_count.hpp"

int byte_count_gold(data_t input[INPUT_SIZE]) {
	int count = 0;
	int appearances[256] = { };

	for (int i = 0; i < INPUT_SIZE; i++) {
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

	std::vector<std::string> paths = {"tb_data/zeros", /*"tb_data/count.bin", "tb_data/count_sorted.bin"*/};
	std::vector<char> input;

	for (std::string path : paths) {
		std::ifstream file(path,
					std::ios::in | std::ios::binary | std::ios::ate);

			if (file.is_open()) {
				std::streampos size = file.tellg();
				input.resize(size);
				file.seekg(0, std::ios::beg);
		//		file.read(input.data(), size);
				file.read(input.data(), INPUT_SIZE);
			} else {
				std::cerr << "Unable to open input file\n";
				return 1;
			}

			std::vector<data_t> data(input.begin(), input.end());
			std::vector<data_t> data0(input.begin(), input.begin() + INPUT_SIZE / 4);
			std::vector<data_t> data1(input.begin() + INPUT_SIZE / 4,
					input.begin() + INPUT_SIZE / 2);
			std::vector<data_t> data2(input.begin() + INPUT_SIZE / 2,
					input.end() - INPUT_SIZE / 4);
			std::vector<data_t> data3(input.end() - INPUT_SIZE / 4, input.end());

			hls::stream<block_t> input_stream("in");
			hls::stream<result_t> output_stream("out");

			block_t block;
			std::copy(data.begin(), data.end(), block.a);
			input_stream.write(block);
//			std::copy(data.begin() + 256, data.end() - 512, block.a);
//			input_stream.write(block);
//			std::copy(data.begin() + 512, data.end() - 256, block.a);
//			input_stream.write(block);
//			std::copy(data.begin() + 768, data.end(), block.a);
//			input_stream.write(block);

			int expected = byte_count_gold(data.data());
			byte_count(input_stream, output_stream);
			int actual = output_stream.read();

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
