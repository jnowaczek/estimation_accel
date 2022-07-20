#include "ap_axi_sdata.h"
#include "ap_int.h"

#include "byte_count_stream.hpp"

//typedef ap_axiu<8, 0, 0, 0> trans_pkt;

#define NUM_THREADS 4

void accelerator(hls::stream<packed_t> &In, hls::stream<result_t> &Out) {
#pragma HLS INTERFACE mode=ap_ctrl_chain port=return
#pragma HLS DATAFLOW

	hls::stream_of_blocks<block_data_t> input0, input1, input2,
			input3 __attribute((no_ctor));
	hls::stream_of_blocks<block_count_t> appear0, appear1, appear2, appear3,
			reduced_blocks __attribute((no_ctor));

	split(In, input0, input1, input2, input3);
	count0(input0, appear0);
	count1(input1, appear1);
	count2(input2, appear2);
	count3(input3, appear3);
	reduce(appear0, appear1, appear2, appear3, reduced_blocks);
	threshold(reduced_blocks, Out);
}

void split(hls::stream<packed_t> &in, hls::stream_of_blocks<block_data_t> &out0,
		hls::stream_of_blocks<block_data_t> &out1,
		hls::stream_of_blocks<block_data_t> &out2,
		hls::stream_of_blocks<block_data_t> &out3) {
#pragma HLS INLINE off

	hls::write_lock<block_data_t> outL0(out0);
	hls::write_lock<block_data_t> outL1(out1);
	hls::write_lock<block_data_t> outL2(out2);
	hls::write_lock<block_data_t> outL3(out3);

	for (int i = 0; i < BLOCK_LENGTH / NUM_THREADS; i += 1) {
		packed_t p = in.read();

		outL0[i] = p.range(7, 0);
		outL1[i] = p.range(15, 8);
		outL2[i] = p.range(23, 16);
		outL3[i] = p.range(31, 24);
	}
}

void count0(hls::stream_of_blocks<block_data_t> &in,
		hls::stream_of_blocks<block_count_t> &out) {
#pragma HLS INLINE off

	hls::write_lock<block_count_t> outL(out);
	hls::read_lock<block_data_t> inL(in);

#pragma HLS DEPENDENCE variable=outL intra RAW false

	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		outL[i] = 0;
	}

	count_t count = 0;

	data_t prev = inL[0];

	APPEARANCES: for (int i = 0; i < BLOCK_LENGTH / NUM_THREADS; i++) {
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

void count1(hls::stream_of_blocks<block_data_t> &in,
		hls::stream_of_blocks<block_count_t> &out) {
#pragma HLS INLINE off

	hls::write_lock<block_count_t> outL(out);

#pragma HLS DEPENDENCE variable=outL intra RAW false

	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		outL[i] = 0;
	}

	count_t count = 0;

	hls::read_lock<block_data_t> inL(in);

	data_t prev = inL[0];

	APPEARANCES: for (int i = 0; i < BLOCK_LENGTH / NUM_THREADS; i++) {
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

void count2(hls::stream_of_blocks<block_data_t> &in,
		hls::stream_of_blocks<block_count_t> &out) {
#pragma HLS INLINE off

	hls::write_lock<block_count_t> outL(out);

#pragma HLS DEPENDENCE variable=outL intra RAW false

	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		outL[i] = 0;
	}

	count_t count = 0;

	hls::read_lock<block_data_t> inL(in);

	data_t prev = inL[0];

	APPEARANCES: for (int i = 0; i < BLOCK_LENGTH / NUM_THREADS; i++) {
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

void count3(hls::stream_of_blocks<block_data_t> &in,
		hls::stream_of_blocks<block_count_t> &out) {
#pragma HLS INLINE off

	hls::write_lock<block_count_t> outL(out);

#pragma HLS DEPENDENCE variable=outL intra RAW false

	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS UNROLL
		outL[i] = 0;
	}

	count_t count = 0;

	hls::read_lock<block_data_t> inL(in);

	data_t prev = inL[0];

	APPEARANCES: for (int i = 0; i < BLOCK_LENGTH / NUM_THREADS; i++) {
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

void reduce(hls::stream_of_blocks<block_count_t> &in0,
		hls::stream_of_blocks<block_count_t> &in1,
		hls::stream_of_blocks<block_count_t> &in2,
		hls::stream_of_blocks<block_count_t> &in3,
		hls::stream_of_blocks<block_count_t> &out) {
#pragma HLS INLINE off

	hls::read_lock<block_count_t> inL0(in0);
	hls::read_lock<block_count_t> inL1(in1);
	hls::read_lock<block_count_t> inL2(in2);
	hls::read_lock<block_count_t> inL3(in3);
	hls::write_lock<block_count_t> outL(out);

	for (int i = 0; i < COUNT_BUCKETS; i += 1) {
		count_t total = inL0[i] + inL1[i] + inL2[i] + inL3[i];
		outL[i] = total;
	}
}

void threshold(hls::stream_of_blocks<block_count_t> &in,
		hls::stream<result_t> &out) {
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
