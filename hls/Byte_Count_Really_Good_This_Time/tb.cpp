/*
 * Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
 * Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "accelerator.h"
#include <cstdio>

#define TEST_SIZE 1024

int main() {
	hls::stream<data_pkt> in, out, software;

	for (int i = 0; i < TEST_SIZE; i++) {
		data_pkt temp;
		temp.data = i;
		temp.last = (i == (TEST_SIZE - 1) ? 1 : 0);
		in.write(temp);
	}

	for (int i = 0; i < TEST_SIZE; i++) {
		data_pkt temp;
		temp.data = i * 2 + 1;
		temp.last = (i == (TEST_SIZE - 1) ? 1 : 0);
		software.write(temp);
	}

	make_go_fast(in, TEST_SIZE, out);

	for (int i = 0; i < TEST_SIZE; i++) {
		data_pkt result = out.read();
		data_pkt expected = software.read();
		if (result.data != expected.data) {
			printf("i=%d %d!=%d FAIL\n", i, result.data, expected.data);
			return 1;
		}
	}
	return 0;
}

