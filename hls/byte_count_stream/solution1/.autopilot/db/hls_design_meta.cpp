#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("s_axi_control_AWVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_AWREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_AWADDR", 5, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_WDATA", 32, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WSTRB", 4, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_ARVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_ARREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_ARADDR", 5, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_RVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_RREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_RDATA", 32, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_RRESP", 2, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_BVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_BREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_BRESP", 2, hls_out, -1, "", "", 1),
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("interrupt", 1, hls_out, -1, "", "", 1),
	Port_Property("In_r_TDATA", 8, hls_in, 0, "axis", "in_data", 1),
	Port_Property("Out_r_TDATA", 8, hls_out, 1, "axis", "out_data", 1),
	Port_Property("Out_r_TKEEP", 1, hls_out, 2, "axis", "out_data", 1),
	Port_Property("Out_r_TSTRB", 1, hls_out, 3, "axis", "out_data", 1),
	Port_Property("Out_r_TLAST", 1, hls_out, 4, "axis", "out_data", 1),
	Port_Property("In_r_TVALID", 1, hls_in, 0, "axis", "in_vld", 1),
	Port_Property("In_r_TREADY", 1, hls_out, 0, "axis", "in_acc", 1),
	Port_Property("Out_r_TVALID", 1, hls_out, 4, "axis", "out_vld", 1),
	Port_Property("Out_r_TREADY", 1, hls_in, 4, "axis", "out_acc", 1),
};
const char* HLS_Design_Meta::dut_name = "accelerator";
