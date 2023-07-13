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

void worker(hls::stream<data_t> &in, hls::stream<data_t> &out) {
	data_t temp = in.read();
	temp = temp * 2 + 1;
	out.write(temp);
}

void make_go_fast(hls::stream<data_pkt> &in, int n, hls::stream<data_pkt> &out) {
#pragma HLS INTERFACE mode=axis port=in
#pragma HLS INTERFACE mode=axis port=out
	hls_thread_local hls::split::round_robin<data_t, NUM_WORKERS> split;
	hls_thread_local hls::merge::round_robin<data_t, NUM_WORKERS> merge;
#pragma HLS DATAFLOW

	read_in(in, n, split.in);

	hls_thread_local hls::task tasks[NUM_WORKERS];

	for (int i = 0; i < NUM_WORKERS; i++) {
#pragma HLS unroll
		tasks[i](worker, split.out[i], merge.in[i]);
	}

	write_out(merge.out, n, out);
}

