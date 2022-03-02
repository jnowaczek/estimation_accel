############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project estimation
set_top byte_count
add_files byte_count.hpp
add_files byte_count.cpp
add_files -tb tb_data -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb byte_count_bench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "byte_count" -flow_target vivado
set_part {xc7z010i-clg225-1L}
create_clock -period 10 -name default
#source "./estimation/byte_count/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
