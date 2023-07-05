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

int main() {
    data a[INTERFACE_WIDTH / DATA_WIDTH];
    data b[INTERFACE_WIDTH / DATA_WIDTH];

    for (int i = 0; i<INTERFACE_WIDTH / DATA_WIDTH; i++)
        a[i] = i;
    make_go_fast(a, b);
    for (int i = 0; i<INTERFACE_WIDTH / DATA_WIDTH; i++) {
        if (b[i] != a[i] * 2 + 1) {
            printf("i=%d %d!=%d FAIL\n", i, b[i], a[i]*2+1);
            return 1;
        }
    }
    return 0;
}

