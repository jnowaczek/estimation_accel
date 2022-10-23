############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project byte_count_stream
set_top accelerator
add_files byte_count_stream/src/byte_count_stream.cpp
add_files byte_count_stream/src/byte_count_stream.hpp
add_files -tb byte_count_stream/src/byte_count_stream_bench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb tb_data -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z010i-clg225-1L}
create_clock -period 9.359 -name default
config_interface -m_axi_addr64=0
config_export -display_name {Byte Count Stream} -format ip_catalog -library byte_count_stream -output E:/estimation_accel/vivado/ip_repo/ -rtl verilog -vendor jnowaczek -version 1.0.10
source "./byte_count_stream/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output E:/estimation_accel/vivado/ip_repo/
