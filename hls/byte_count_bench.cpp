#include <array>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "byte_count.hpp"
#include "byte_count_gold.hpp"

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

	std::vector<data_t> data(input.begin(), input.end());

	int expected = byte_count_gold(data.data());
	result_t actual = byte_count(data.data());

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
