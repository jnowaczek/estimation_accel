#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"

typedef ap_axiu<8, 0, 0, 0> input_pkt;
typedef ap_axiu<8, 0, 0, 0> output_pkt;
struct data {
	ap_int<8> data;
	ap_int<1> last;
};

void split_input_stream(hls::stream<input_pkt> &input_stream,
		hls::stream<data> &output_stream) {
	input_pkt in_value = input_stream.read();

	do {
		for (int i = 0; i < 1; i++) {
			data out_val = { in_value.data, in_value.last };
			output_stream.write(out_val);
		}
	} while (!in_value.last);
}

void process_split_stream(hls::stream<data> &input_stream,
		hls::stream<output_pkt> &output_stream) {
	data in_value = input_stream.read();

	if (in_value.last) {
		output_pkt out_val = { in_value.data, in_value.last };
		output_stream.write(out_val);
	}
}

void make_go_fast(hls::stream<input_pkt> &InStream,
		hls::stream<output_pkt> &OutStream) {
#pragma HLS INTERFACE axis register_mode=both register port=InStream
#pragma HLS INTERFACE axis register_mode=both register port=OutStream
#pragma HLS INTERFACE s_axilite port=return

#pragma HLS DATAFLOW

	hls::stream<data, 256> split_buffer;
	split_input_stream(InStream, split_buffer);
	process_split_stream(split_buffer, OutStream);
}

