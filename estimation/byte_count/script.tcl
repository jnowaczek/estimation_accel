############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project estimation
set_top byte_count
add_files byte_count.c++
add_files byte_count.hpp
add_files -tb byte_count_bench.c++ -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb tb_data -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "byte_count" -flow_target vitis
set_part {xc7z020-clg484-1}
create_clock -period 100MHz -name default
config_export -format xo -output C:/estimation -rtl verilog -version 1.0.0 -vivado_clock 100MHz
config_interface -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512
config_rtl -register_reset_num 3
source "./estimation/byte_count/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format xo -output C:/estimation
