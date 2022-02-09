#include <array>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "byte_count.hpp"

int byte_count_gold(bytecount::data_t input[BLOCK_LENGTH]) {
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

int main() {
	int retval = 0;
	std::vector<char> input;

	std::ifstream file ("tb_data/zeros", std::ios::in|std::ios::binary|std::ios::ate);

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

	std::vector<bytecount::data_t> data(input.begin(), input.end());

	int expected = byte_count_gold(data.data());
	int actual = bytecount::byte_count(data.data());

	if(actual == expected){
		 std::cout << "    *** *** *** *** \n";
	 	 std::cout << "    Results are good: expected == actual == " << actual << "\n";
	 	 std::cout << "    *** *** *** *** \n";
	 } else {
		 std::cout << "    *** *** *** *** \n";
		 std::cout << "    Mismatch: result=" << actual << ", expected=" << expected << "\n";
		 std::cout << "    *** *** *** *** \n";
		 retval = 2;
	 }

	return retval;
}
