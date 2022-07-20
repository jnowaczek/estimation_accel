#include <array>
#include <fstream>
#include <limits>
#include <iostream>
#include <string>
#include <vector>
#include <unistd.h>

#include "byte_count_stream.hpp"

void byte_count_gold(data_t *input, size_t length,
		std::vector<result_t> &results) {
	assert((length % 1024) == 0);

	for (int b = 0; b < length; b += 1024) {
		int count = 0;
		int appearances[256] = { };

		for (int i = 0; i < BLOCK_LENGTH; i++) {
			appearances[input[(1024 * b) + i]] += 1;
		}

		for (auto bucket : appearances) {
			if (bucket > BYTE_COUNT_THRESHOLD) {
				count += 1;
			}
		}

		results.push_back(count);
	}
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
		std::ifstream file(path, std::ios::in | std::ios::binary);

		if (file.is_open()) {
			// Yoinked from https://stackoverflow.com/questions/22984956/tellg-function-give-wrong-size-of-file/22986486#22986486
			file.ignore( std::numeric_limits<std::streamsize>::max() );
			std::streamsize length = file.gcount();
			file.clear();   //  Since ignore will have set eof.
			int trimmedSize = (length / 1024) * 1024;

			file.seekg(0, std::ios::beg);

			input.resize(trimmedSize);
			file.read(input.data(), trimmedSize);
			file.close();
		} else {
			std::cerr << "Unable to open input file '" << path << "'\n";
			return 1;
		}

		std::vector<data_t> data(input.begin(), input.end());
		hls::stream<packed_t> inputStream("Input Stream");
		hls::stream<result_t> outputStream("Output Stream");

		for (int i = 0; i < data.size(); i += 2) {
			packed_t upper = data[i];
			data_t lower = data[i + 1];
			upper = upper << 8;
			upper = upper | lower;
			inputStream << upper;
		}

		std::vector<result_t> expected;
		byte_count_gold(data.data(), data.size(), expected);

		std::vector<result_t> actual;
		accelerator(inputStream, outputStream);
		while (!outputStream.empty()) {
			actual.push_back(outputStream.read());
		}

		assert(inputStream.empty());

		if (actual == expected) {
			std::cout << "    *** *** *** *** \n";
			std::cout << "    Input file: " << path << "\n";
			std::cout << "    Results are good: expected == actual:\n";
			for (result_t n : actual) {
				std::cout << n << ", ";
			}
			std::cout << "    *** *** *** *** \n";
		} else {
			std::cout << "    *** *** *** *** \n";
			std::cout << "    Input file: " << path << "\n";
			std::cout << "    Result mismatch.\n    Actual:\n";
			for (result_t n : actual) {
				std::cout << n << ", ";
			}
			std::cout << "\n\n    Expected:\n";
			for (result_t n : expected) {
				std::cout << n << ", ";
			}
			std::cout << "\n    *** *** *** *** \n";
			retval = 2;
		}
	}

	return retval;
}
