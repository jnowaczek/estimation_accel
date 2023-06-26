vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/xlconcat_v2_1_4
vlib questa_lib/msim/xil_defaultlib

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap xlconcat_v2_1_4 questa_lib/msim/xlconcat_v2_1_4
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xilinx_vip  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xlconcat_v2_1_4  -incr -mfcu "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../zc702_estimation_platform.gen/sources_1/bd/concat_intr/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/concat_intr/ip/concat_intr_xlconcat_0_0/sim/concat_intr_xlconcat_0_0.v" \
"../../../bd/concat_intr/sim/concat_intr.v" \

sccom -work xil_defaultlib -64 -cpppath "/g++" -std=c++11 -I "../../../bd/system/ip/system_processing_system7_0_0/sim_tlm" -I "../../../../zc702_estimation_platform.gen/sources_1/bd/system/ip/system_processing_system7_0_0/sim_tlm" -I "../../../bd/system/ip/system_processing_system7_0_0/sim" -I "C:/Xilinx/Vivado/2022.1/tps/boost_1_72_0" -I "C:/Xilinx/Vivado/2022.1/tps/boost_1_72_0" -I "C:/Xilinx/Vivado/2022.1/data/xsim/ip/remote_port_c_v4/include" -I "C:/Xilinx/Vivado/2022.1/data/xsim/ip/common_cpp_v1_0/include" -I "C:/Xilinx/Vivado/2022.1/data/xsim/ip/xtlm/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim_tlm/processing_system7_v5_5_tlm.cpp" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0_sc.cpp" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.cpp" \

vlog -work xil_defaultlib \
"glbl.v"

