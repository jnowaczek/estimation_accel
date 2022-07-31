############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project byte_count_stream
set_top accelerator
add_files byte_count_stream/src/byte_count_stream.hpp
add_files byte_count_stream/src/byte_count_stream.cpp
add_files -tb tb_data -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb byte_count_stream/src/byte_count_stream_bench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z010i-clg225-1L}
create_clock -period 10 -name default
config_interface -m_axi_addr64=0
source "./byte_count_stream/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
