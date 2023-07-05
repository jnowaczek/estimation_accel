#pragma once

#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_np_channel.h"
#include "hls_stream.h"
#include "hls_task.h"

#define INTERFACE_WIDTH 512
#define NUM_WORKERS 8
#define DATA_WIDTH 8

typedef ap_uint<DATA_WIDTH> data;

void make_go_fast(hls::axis<data, 0, 0, 0> &in, hls::axis<data, 0, 0, 0> &out);
