#include "accelerator.h"

void read_in(hls::stream<data_pkt> &in, hls::stream<data_t> &out) {
	for (int i = 0; i < BLOCK_LENGTH; i++) {
		data_pkt temp_pkt;
		data_t temp;
		in.read(temp_pkt);
		temp = temp_pkt.data;
		out.write(temp);
	}
}

void count_appearances(hls::stream<data_t> &in, hls::stream_of_blocks<count_buf_t> &appearances) {
#pragma HLS INLINE off
	data_t prev = 0;
	count_t count = 0;
	data_t byte;

	hls::write_lock<count_buf_t> appL(appearances);

	// Assume fixed length blocks for now
	for (int i = 0; i < BLOCK_LENGTH; i++) {
#pragma HLS DEPENDENCE variable=appL intra raw false
		byte = in.read();

		if (prev == byte) {
			count += 1;
		} else {
			appL[prev] = count;
			count = appL[byte] + 1;
		}

		prev = byte;
	}
	appL[prev] = count;
}

void threshold(hls::stream_of_blocks<count_buf_t> &in, hls::stream<result_t> &out) {
#pragma HLS INLINE off
	result_t over_thresh = 0;

	hls::read_lock<count_buf_t> inL(in);

	for (int i = 0; i < 256; i++) {
		if (inL[i] > BLOCK_LENGTH / 256) {
			over_thresh += 1;
		}
	}
	out.write(over_thresh);
}

//void reduce_appearances(hls::stream_of_blocks<count_buf_t> &appearances0, hls::stream_of_blocks<count_buf_t> &appearances1,
//		hls::stream_of_blocks<count_buf_t> &appearances2, hls::stream_of_blocks<count_buf_t> &appearances3,
//		hls::stream_of_blocks<count_buf_t> &combined_apperances) {
//	hls::read_lock<count_buf_t> inL0(appearances0);
//	hls::read_lock<count_buf_t> inL1(appearances1);
//	hls::read_lock<count_buf_t> inL2(appearances2);
//	hls::read_lock<count_buf_t> inL3(appearances3);
//	hls::write_lock<count_buf_t> outL(combined_apperances);
//
//	for (int i = 0; i < 256; i++) {
//		outL[i] = inL0[i] + inL1[i] + inL2[i] + inL3[i];
//	}
//}

void reduce_appearances(hls::stream_of_blocks<count_buf_t> &appearances0, hls::stream_of_blocks<count_buf_t> &combined_apperances) {
#pragma HLS INLINE off
	hls::read_lock<count_buf_t> inL0(appearances0);
	hls::write_lock<count_buf_t> outL(combined_apperances);

	for (int i = 0; i < 256; i++) {
		outL[i] = inL0[i];
	}
}

void make_go_fast(hls::stream<data_pkt> &in, hls::stream<result_t> &out) {
#pragma HLS INTERFACE mode=axis port=in
#pragma HLS INTERFACE mode=axis port=out
#pragma HLS DATAFLOW

	hls::stream<data_t, 1024> split;
	hls::stream_of_blocks<count_buf_t, 256> appearances;
	hls::stream_of_blocks<count_buf_t, 256> combined;

	read_in(in, split);

	count_appearances(split, appearances);

	reduce_appearances(appearances, combined);

	threshold(combined, out);
}
