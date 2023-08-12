############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project Byte_Count_Really_Good_This_Time
set_top make_go_fast
add_files Byte_Count_Really_Good_This_Time/accelerator.cpp
add_files Byte_Count_Really_Good_This_Time/accelerator.h
add_files -tb Byte_Count_Really_Good_This_Time/tb.cpp -cflags "-Wno-unknown-pragmas"
add_files -tb Byte_Count_Really_Good_This_Time/tb_data -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 5 -name default
config_debug -enable
config_export -output E:/estimation_accel/hls/Byte_Count_Really_Good_This_Time
source "./Byte_Count_Really_Good_This_Time/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -tool xsim
export_design -rtl verilog -format ip_catalog -output E:/estimation_accel/hls/Byte_Count_Really_Good_This_Time
