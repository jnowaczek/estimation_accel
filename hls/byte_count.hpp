#pragma once

#ifdef __linux__
// Workaround mpfr.h bug preventing cosimulation
// Ref: https://support.xilinx.com/s/question/0D52E00006iHkfpSAC/vivado-20153-hls-bug-gmph
#include "/tools/Xilinx/Vitis_HLS/2021.2/include/gmp.h"
#endif

#include "ap_fixed.h"
#include "ap_int.h"

#include "byte_count_types.hpp"

void count_appearances(data_t *input, count_t *appearances);

result_t count_threshold(count_t *appearances);

result_t byte_count(data_t input[BLOCK_LENGTH]);
