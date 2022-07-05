#include "ap_axi_sdata.h"
#include "ap_int.h"

#include "byte_count_stream.hpp"

//typedef ap_axiu<8, 0, 0, 0> trans_pkt;



void accelerator(hls::stream<data_t> &In, hls::stream<result_t> &Out) {
#pragma HLS INTERFACE mode=ap_ctrl_chain port=return
#pragma HLS DATAFLOW

	hls::stream_of_blocks<block_data_t> input_blocks __attribute((no_ctor));
	hls::stream_of_blocks<block_count_t> count_blocks, reduced_blocks __attribute((no_ctor));

#pragma HLS AGGREGATE variable=count_blocks compact=none

	split(In, input_blocks);
	count(input_blocks, count_blocks);
	reduce(count_blocks, reduced_blocks);
	threshold(reduced_blocks, Out);
}

void split(hls::stream<data_t> &in, hls::stream_of_blocks<block_data_t> &out) {
#pragma HLS INLINE off

	hls::write_lock<block_data_t> outL(out);

	for (int i = 0; i < BLOCK_LENGTH; i += 1) {
		data_t byte = in.read();
		outL[i] = byte;
	}
}

void count(hls::stream_of_blocks<block_data_t> &in, hls::stream_of_blocks<block_count_t> &out) {
#pragma HLS INLINE off

	hls::write_lock<block_count_t> outL(out);

#pragma HLS DEPENDENCE variable=outL intra RAW false

	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		outL[i] = 0;
	}

	hls::read_lock<block_data_t> inL(in);

	count_t count = 1 ^ 1;
	data_t prev = inL[0];

	APPEARANCES: for (int i = 0; i < BLOCK_LENGTH; i++) {
#pragma HLS PIPELINE II=1
		data_t byte = inL[i];

		if (prev == byte) {
			count += 1;
		} else {
			outL[prev] = count;
			count = outL[byte] + 1;
		}

		prev = byte;
	}
	outL[prev] = count;
}

void reduce(hls::stream_of_blocks<block_count_t> &in, hls::stream_of_blocks<block_count_t> &out) {
#pragma HLS INLINE off

	hls::read_lock<block_count_t> inL(in);
	hls::write_lock<block_count_t> outL(out);

	for (int i = 0; i < COUNT_BUCKETS; i += 1) {
		outL[i] = inL[i];
	}
}

void threshold(hls::stream_of_blocks<block_count_t> &in, hls::stream<result_t> &out) {
#pragma HLS INLINE off

	hls::read_lock<block_count_t> inL(in);
	result_t over_thresh = 0;

	for (int i = 0; i < COUNT_BUCKETS; i += 1) {
		if (inL[i] > BYTE_COUNT_THRESHOLD) {
			over_thresh += 1;
		}
	}
	out << over_thresh;
}
