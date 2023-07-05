#include "accelerator.h"

void read_in(hls::axis<data, 0, 0, 0> &in, hls::stream<data> &out) {
	for (int i = 0; i < INTERFACE_WIDTH / NUM_WORKERS; i++) {
		auto packet;
		in.read(packet);
		out.write(packet.data);
	}
}

void write_out(hls::stream<data> &in, hls::axis<data, 0, 0, 0> &out) {
	for (int i = 0; i < INTERFACE_WIDTH / NUM_WORKERS; i++) {
		out[i] = in.read();
	}
}

void worker(hls::stream<data> &in, hls::stream<data> &out) {
	int i = in.read();
	int o = i * 2 + 1;
	out.write(o);
}

void make_go_fast(hls::axis<data, 0, 0, 0> &in, hls::axis<data, 0, 0, 0> &out) {
#pragma HLS INTERFACE mode=axis port=in
#pragma HLS INTERFACE mode=axis port=out
	hls_thread_local hls::split::round_robin<data, NUM_WORKERS> split;
	hls_thread_local hls::merge::round_robin<data, NUM_WORKERS> merge;
#pragma HLS DATAFLOW

	read_in(in, split.in);

	hls_thread_local hls::task tasks[NUM_WORKERS];

	for (int i = 0; i < NUM_WORKERS; i++) {
#pragma HLS unroll
		tasks[i](worker, split.out[i], merge.in[i]);
	}

	write_out(merge.out, out);
}

