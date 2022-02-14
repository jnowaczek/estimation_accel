############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project estimation
set_top byte_count
add_files byte_count.cpp
add_files byte_count.hpp
add_files -tb byte_count_bench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb tb_data -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "byte_count" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 100MHz -name default
config_export -format ip_catalog -library estimation -output /home/vivado/Desktop/estimation_hls -rtl verilog -vendor jnowaczek -version 1.0.0 -vivado_clock 100MHz
config_rtl -reset state -reset_level low
source "./estimation/byte_count/directives.tcl"
csim_design -profile
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/vivado/Desktop/estimation_hls
