#include "ap_axi_sdata.h"
#include "ap_int.h"

#include "byte_count_stream.hpp"

void accelerator(hls::stream<data_t> &In, unsigned int num_blocks, hls::stream<result_t> &Out) {
#pragma HLS INTERFACE mode=ap_ctrl_chain port=return
#pragma HLS DATAFLOW

	count_t appear[COUNT_BUCKETS];
	unsigned int counter = 0;

	while (counter < num_blocks) {
		count(In, appear);
		threshold(appear, Out);
		counter += 1;
	}
}

void count(hls::stream<data_t> &in, count_t appear[COUNT_BUCKETS]) {
#pragma HLS INLINE off
#pragma HLS DEPENDENCE variable=appear intra RAW false

	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		appear[i] = 0;
	}

	count_t count = 0;

	data_t prev;

	APPEARANCES: for (int i = 0; i < BLOCK_LENGTH; i++) {
#pragma HLS PIPELINE II=1
		data_t byte = in.read();

		if (i == 0) {
			prev = byte;
		}

		if (prev == byte) {
			count += 1;
		} else {
			appear[prev] = count;
			count = appear[byte] + 1;
		}

		prev = byte;
	}
	appear[prev] = count;
}

void threshold(count_t appear[BLOCK_LENGTH], hls::stream<result_t> &out) {
#pragma HLS INLINE off

	result_t over_thresh = 0;

	for (int i = 0; i < COUNT_BUCKETS; i += 1) {
		if (appear[i] > BYTE_COUNT_THRESHOLD) {
			over_thresh += 1;
		}
	}
	out << over_thresh;
}
