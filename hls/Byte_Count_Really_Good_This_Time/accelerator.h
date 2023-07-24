#pragma once

#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_np_channel.h"
#include "hls_stream.h"
#include "hls_streamofblocks.h"
#include "hls_task.h"

#define BLOCK_LENGTH 1024

#define INTERFACE_WIDTH 512
#define NUM_WORKERS 4
#define DATA_WIDTH 8

// Top-level I/O type
typedef ap_axis<DATA_WIDTH, 0, 0, 0> data_pkt;

// Single data type
typedef ap_int<DATA_WIDTH> data_t;

// Appearance count type
// TODO: Maybe replace with saturating ap_uint to save resources
typedef uint16_t count_t;

void make_go_fast(hls::stream<data_pkt> &in, hls::stream<data_pkt> &out);
