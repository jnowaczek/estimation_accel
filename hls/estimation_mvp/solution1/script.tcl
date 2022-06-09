############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project estimation_mvp
set_top byte_count
add_files byte_count_mvp.hpp
add_files byte_count_mvp.cpp
add_files byte_count_bench_mvp.cpp
add_files -tb tb_data -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb byte_count_bench_mvp.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z010i-clg225-1L}
create_clock -period 10 -name default
config_export -display_name Byte_Count_MVP -format ip_catalog -library byte_count_mvp -output E:/estimation_accel/vivado/ip_repo -rtl verilog -vendor jnowaczek -version 1.5.0
config_interface -m_axi_addr64=0 -m_axi_alignment_byte_size 32
source "./estimation_mvp/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output E:/estimation_accel/vivado/ip_repo
