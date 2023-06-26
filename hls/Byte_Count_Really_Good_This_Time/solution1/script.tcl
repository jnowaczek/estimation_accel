############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Byte_Count_Really_Good_This_Time
set_top make_go_fast
add_files Byte_Count_Really_Good_This_Time/accelerator.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output E:/estimation_accel/hls/Byte_Count_Really_Good_This_Time -rtl verilog
source "./Byte_Count_Really_Good_This_Time/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl verilog -format ip_catalog -output E:/estimation_accel/hls/Byte_Count_Really_Good_This_Time
