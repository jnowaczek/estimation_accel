#pragma once

#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_np_channel.h"
#include "hls_stream.h"
#include "hls_task.h"

#define INTERFACE_WIDTH 512
#define NUM_WORKERS 8
#define DATA_WIDTH 8

typedef ap_axis<DATA_WIDTH, 0, 0, 0> data_pkt;
typedef ap_int<DATA_WIDTH> data_t;

void make_go_fast(hls::stream<data_pkt> &in, int n, hls::stream<data_pkt> &out);
