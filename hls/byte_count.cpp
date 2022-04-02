#include "byte_count.hpp"

void byte_count(hls::stream<data_t> &input, hls::stream<result_t> &out) {
#pragma HLS DATAFLOW

	hls::stream<count_block_t> appearances;
	hls::stream<count_block_t> combined_appearances;

	count_streaming(input, appearances);
//	count_streaming(input, appearances[1]);
//	count_streaming(input, appearances[2]);
//	count_streaming(input, appearances[3]);

	reduce_streaming(appearances, combined_appearances);

	threshold_streaming(combined_appearances, out);
}

void count_streaming(hls::stream<block_t> &input, hls::stream<count_block_t> &output) {
	block_t temp;
	count_block_t appearances;
#pragma HLS DEPENDENCE variable=appearances intra RAW false

	if (input.read_nb(temp)) {

		RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS PIPELINE II=1
			appearances.a[i] = 0;
		}

		int count = 0;
		data_t byte;
		data_t prev = temp.a[0];

		for (iter_t i = 0; i < BLOCK_SIZE; i++) {
			byte = temp.a[i];

			if (prev == byte) {
				count +=1;
			} else {
				appearances.a[prev] = count;
				count = appearances.a[byte] + 1;
			}

			prev = byte;
		}
		appearances.a[prev] = count;
		output.write(appearances);
	}
}


// Heavily borrowed from https://kastner.ucsd.edu/hlsbook/ page 162 as the
// example is almost exactly what I want to do.
void count_appearances(data_t input[INPUT_SIZE / WORKER_COUNT],
		count_t appearances[COUNT_BUCKETS]) {
#pragma HLS DEPENDENCE variable=appearances intra RAW false
	RESET: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS PIPELINE II=1
			appearances[i] = 0;
	}
	count_t count = 0;
	iter_t i;
	data_t byte;
	data_t prev = input[0];
	APPEARANCES: for (i = 0; i < INPUT_SIZE / 4; i++) {
#pragma HLS PIPELINE II=1
		byte = input[i];

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

void reduce_streaming(hls::stream<count_block_t> &input, hls::stream<count_block_t> &output) {
	count_block_t combined_appearances = {0};
	count_block_t appearances = input.read();
	REDUCE: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS PIPELINE II=1
		count_t prev = combined_appearances.a[i];
		prev = prev + appearances.a[i];
		combined_appearances.a[i] = prev;
	}
	output.write(combined_appearances);
}

void reduce_appearances(count_t appearances[WORKER_COUNT][COUNT_BUCKETS], count_t combined_apperances[COUNT_BUCKETS]) {
	REDUCE: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
#pragma HLS PIPELINE II=1
		count_t total = 0;
		for (int j = 0; j < WORKER_COUNT; j++) {
			total += appearances[j][i];
		}
		combined_apperances[i] = total;
	}
}

void count_threshold(count_t appearances[COUNT_BUCKETS], hls::stream<result_t> &output) {
	result_t over_thresh = 0;

	THRESHOLD: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
		if (appearances[i] > BYTE_COUNT_THRESHOLD)
			over_thresh += 1;
	}

	output.write(over_thresh);
}

void threshold_streaming(hls::stream<count_block_t> &input, hls::stream<result_t> &output) {
	count_block_t appearances = input.read();
	result_t over_thresh = 0;

	THRESHOLD: for (iter_t i = 0; i < COUNT_BUCKETS; i++) {
		if (appearances.a[i] > BYTE_COUNT_THRESHOLD)
			over_thresh += 1;
	}

	output.write(over_thresh);
}

