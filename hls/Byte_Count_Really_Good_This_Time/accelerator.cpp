#include "accelerator.h"

void read_in(hls::stream<data_pkt> &in, int n, hls::stream<data_t> &out) {
	for (int i = 0; i < n; i++) {
		data_pkt temp_pkt;
		data_t temp;
		in.read(temp_pkt);
		temp = temp_pkt.data;
		out.write(temp);
	}
}

void write_out(hls::stream<data_t> &in, int n, hls::stream<data_pkt> &out) {
	for (int i = 0; i < n; i++) {
		data_t temp = in.read();
		data_pkt temp_pkt;
		temp_pkt.data = temp;
		out.write(temp_pkt);
	}
}

void count_appearances(hls::stream<data_t> &in, hls::stream_of_blocks<data_t[256]> &appearances) {
	hls::write_lock (out);
	data_t prev = 0;
	count_t count = 0;

	// Assume fixed length blocks for now
	for (int i = 0; i < BLOCK_LENGTH / NUM_WORKERS; i++) {
#pragma HLS DEPENDENCE variable=appearances intra RAW false
		data_t byte = in.read();

		if (prev == byte) {
			count += 1;
		} else {
			appearances[prev] = count;
			count = appearances[byte] + 1;
		}

		prev = byte;
	}
	appearances[prev] = count;
}

void make_go_fast(hls::stream<data_pkt> &in, hls::stream<data_pkt> &out) {
#pragma HLS INTERFACE mode=axis port=in
#pragma HLS INTERFACE mode=axis port=out
	hls_thread_local hls::split::round_robin<data_t, NUM_WORKERS> split;
	hls_thread_local hls::merge::round_robin<data_t, NUM_WORKERS> merge;
#pragma HLS DATAFLOW

	read_in(in, n, split.in);

	hls_thread_local hls::stream_of_blocks<data_t[256]> sob[NUM_WORKERS];
	hls_thread_local hls::task tasks[NUM_WORKERS];

	for (int i = 0; i < NUM_WORKERS; i++) {
#pragma HLS unroll
		tasks[i](worker, split.out[i], merge.in[i]);
	}

	write_out(merge.out, n, out);
}

