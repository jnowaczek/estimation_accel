#include <array>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "byte_count.hpp"

int main() {
	int result = 0;
	std::vector<char> input;

	std::ifstream file ("tb_data\\zeros", std::ios::in|std::ios::binary|std::ios::ate);

	if (file.is_open()) {
		std::streampos size = file.tellg();
		input.resize(size);
		file.seekg(0, std::ios::beg);
//		file.read(input.data(), size);
		file.read(input.data(), BLOCK_LENGTH);
	} else {
		return -1;
	}

	std::vector<bytecount::data_t> data(input.begin(), input.end());

	int retval = bytecount::byte_count(data.data());

	if(retval == 1){
		 std::cout << "    *** *** *** *** \n";
	 	 std::cout << "    Results are good \n";
	 	 std::cout << "    *** *** *** *** \n";
	 } else {
		 std::cout << "    *** *** *** *** \n";
		 std::cout << "    Mismatch: retval=" << retval << " \n";
		 std::cout << "    *** *** *** *** \n";
	 }

	return 0;
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
