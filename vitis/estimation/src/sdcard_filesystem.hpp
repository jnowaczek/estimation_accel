#pragma once

#include "xparameters.h"
#include "xsdps.h"
#include "xil_printf.h"
#include "ff.h"
#include "xil_cache.h"
#include "xplatform_info.h"

#include "boost/filesystem/path.hpp"

namespace fs = boost::filesystem;

class SDCardFilesystem {
	static FIL file;
	static FATFS fatfs;

public:
	SDCardFilesystem();
	static FRESULT readWholeFile(fs::path path);
	static FRESULT writeWholeFile(fs::path path, const void* buff, size_t length);
	static FRESULT appendFile(fs::path path, const void* buff, size_t length);
};
