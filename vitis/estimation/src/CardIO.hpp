#pragma once

#include <string>
#include <vector>

#include "boost/align.hpp"
#include "ff.h"

#include "ByteCountTypes.hpp"

FRESULT listTests(std::string path, std::vector<std::string> &fileList) {
	FRESULT res;
	DIR dir;
	static FILINFO fno;

	res = f_opendir(&dir, path.c_str()); /* Open the directory */
	if (res == FR_OK) {
		for (;;) {
			res = f_readdir(&dir, &fno); /* Read a directory item */
			if (res != FR_OK || fno.fname[0] == 0) {
				if (res != FR_OK) {
					std::cerr << "Filesystem error: " << res << "\n";
				} else {
//					std::cout << "Reached end of directory: " << path << "\n";
				}
				break; /* Break on error or end of dir */
			}
			if (fno.fattrib & AM_DIR) { /* It is a directory */
				std::string subdir = path + "/" + fno.fname;
				res = listTests(subdir, fileList); /* Enter the directory */
				if (res != FR_OK)
					break;
			} else { /* It is a file. */
				std::string filePath = path + "/" + fno.fname;
				fileList.push_back(filePath);
			}
		}
		f_closedir(&dir);
	} else {
		std::cerr << "Filesystem error on path '" << path << "': " << res
				<< "\n";
	}

	return res;
}

void loadTest(std::string path, alignedDataVector_t &data) {
	FRESULT res;
	FIL fil;
	UINT bytesRead;

	if (VERBOSE)
		std::cout << "Reading test file '" << path << "'\n";

	res = f_open(&fil, path.c_str(), FA_READ);

	if (res != FR_OK)
		std::cerr << "Failed to load test data '" << path << "'\n";

	UINT fileSize = f_size(&fil);
	if (VERBOSE)
		std::cout << " |  Test size: " << fileSize << " bytes (" << 1024
				<< " bytes testable)\n";

	data.resize(fileSize);

	res = f_read(&fil, data.data(), fileSize, &bytesRead);
	if (bytesRead < fileSize)
		std::cerr << "Something went wrong reading that file there boyo\n...";

	f_close(&fil);
}
