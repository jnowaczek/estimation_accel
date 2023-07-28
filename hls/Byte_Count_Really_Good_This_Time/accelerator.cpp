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

void threshold(hls::stream_of_blocks<count_buf_t> &in, hls::stream<uint8_t> &out) {
	result_t over_thresh = 0;
	for (int i = 0; i < 256; i++) {
		hls::read_lock<count_buf_t> inL(in);
		if (inL[i] > BLOCK_LENGTH / 256) {
			over_thresh += 1;
		}
	}
	out.write(over_thresh);
}

void clear_appearances(hls::stream_of_blocks<count_buf_t> &appearances) {
#pragma HLS INLINE off
	for (int i = 0; i < 256; i++) {
		hls::write_lock<count_buf_t> appL(appearances);
		appL[i] = 0;
	}
}

void count_appearances(hls::stream<data_t> &in, hls::stream_of_blocks<count_buf_t> &appearances) {
#pragma HLS INLINE off
	data_t prev = 0;
	count_t count = 0;
	data_t byte;

	// Assume fixed length blocks for now
	for (int i = 0; i < BLOCK_LENGTH; i++) {
		byte = in.read();

		if (prev == byte) {
			count += 1;
		} else {
			hls::write_lock<count_buf_t> appL(appearances);
			appL[prev] = count;
			count_t current = appL[byte];
			count = current + 1;
		}

		prev = byte;
	}
	hls::write_lock<count_buf_t> appL(appearances);
	appL[prev] = count;
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

	hls_thread_local hls::split::round_robin<data_t, NUM_WORKERS> split;
	hls_thread_local hls::stream_of_blocks<count_buf_t, 4> appearances;
	hls_thread_local hls::stream_of_blocks<count_buf_t, 4> combined;

	hls_thread_local hls::task readTask;
	hls_thread_local hls::task clearTasks[NUM_WORKERS];
	hls_thread_local hls::task countTasks[NUM_WORKERS];

	readTask(read_in, in, split.in);
	clearTasks[0](clear_appearances, appearances);
//	countTasks[0](count_appearances, split.out[0], appearances);

	reduce_appearances(appearances, combined);

	threshold(combined, out);
}

