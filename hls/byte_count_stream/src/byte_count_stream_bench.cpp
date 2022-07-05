#include <array>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "byte_count_stream.hpp"

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

	std::vector<std::string> paths = { "tb_data/zeros", "tb_data/count.bin",
			"tb_data/count_sorted.bin", "tb_data/cantrbry/alice29.txt",
			"tb_data/cantrbry/asyoulik.txt", "tb_data/cantrbry/cp.html",
			"tb_data/cantrbry/fields.c", "tb_data/cantrbry/grammar.lsp",
			"tb_data/cantrbry/kennedy.xls", "tb_data/cantrbry/lcet10.txt",
			"tb_data/cantrbry/plrabn12.txt", "tb_data/cantrbry/ptt5",
			"tb_data/cantrbry/sum", "tb_data/cantrbry/xargs.1" };
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
			hls::stream<data_t> inputStream;
			hls::stream<result_t> outputStream;

			for (int i = 0; i < BLOCK_LENGTH; i++) {
				inputStream.write(data[i]);
			}

			int expected = byte_count_gold(data.data());
			accelerator(inputStream, outputStream);
			int actual = outputStream.read();

			assert(inputStream.empty());

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
