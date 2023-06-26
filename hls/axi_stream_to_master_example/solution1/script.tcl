############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axi_stream_to_master_example
set_top example
add_files example.cpp
add_files example.h
add_files -tb example_test.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z010iclg225-1L}
create_clock -period 10 -name default
config_export -output E:/estimation_accel/vivado/axi_stream_to_master_example
#source "./axi_stream_to_master_example/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output E:/estimation_accel/vivado/axi_stream_to_master_example
