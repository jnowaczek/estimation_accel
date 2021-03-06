############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project estimation
set_top byte_count
add_files byte_count.cpp
add_files byte_count.hpp
add_files -tb byte_count_bench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb tb_data -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "byte_count" -flow_target vivado
set_part {xc7z010i-clg225-1L}
create_clock -period 6.8 -name default
config_export -library bytecount -output E:/estimation_accel/vivado/ip_repo -vendor jnowaczek -version 1.9 -vivado_clock 6.8
config_interface -m_axi_addr64=0 -m_axi_alignment_byte_size 32 -m_axi_max_widen_bitwidth 512
#source "./estimation/byte_count/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output E:/estimation_accel/vivado/ip_repo
