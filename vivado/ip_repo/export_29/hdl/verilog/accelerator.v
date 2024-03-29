// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="accelerator_accelerator,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010i-clg225-1L,HLS_INPUT_CLOCK=9.359000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.659300,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=968,HLS_SYN_LUT=2856,HLS_VERSION=2022_1}" *)

module accelerator (
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        ap_clk,
        ap_rst_n,
        In_r_TDATA,
        Out_r_TDATA,
        Out_r_TKEEP,
        Out_r_TSTRB,
        Out_r_TLAST,
        In_r_TVALID,
        In_r_TREADY,
        Out_r_TVALID,
        Out_r_TREADY,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle
);

parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
input   ap_clk;
input   ap_rst_n;
input  [7:0] In_r_TDATA;
output  [7:0] Out_r_TDATA;
output  [0:0] Out_r_TKEEP;
output  [0:0] Out_r_TSTRB;
output  [0:0] Out_r_TLAST;
input   In_r_TVALID;
output   In_r_TREADY;
output   Out_r_TVALID;
input   Out_r_TREADY;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;

reg ap_idle;

 reg    ap_rst_n_inv;
wire   [31:0] num_blocks;
wire   [7:0] dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TDATA;
wire   [0:0] dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TKEEP;
wire   [0:0] dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TSTRB;
wire   [0:0] dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TLAST;
wire    dataflow_in_loop_VITIS_LOOP_10_1_U0_In_r_TREADY;
wire    dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_start;
wire    dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TVALID;
wire    dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_done;
wire    dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_ready;
wire    dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_idle;
wire    dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_continue;
wire    ap_bound_full_n;
reg    ap_bound_write;
wire   [31:0] ap_bound_dout;
wire    ap_bound_empty_n;
wire    ap_bound_read;
reg   [31:0] ap_loop_dataflow_input_count;
reg   [31:0] ap_loop_dataflow_output_count;
wire   [31:0] ap_bound_minus_1;
wire   [31:0] ap_bound_minus_1_output;
reg    ap_real_start;
reg    ap_partial_ready;
reg    ap_internal_ready;
reg    ap_internal_done;
wire    ap_bound_ack;
reg    ap_bound_reg_ack;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_loop_dataflow_input_count = 32'd0;
#0 ap_loop_dataflow_output_count = 32'd0;
#0 ap_bound_reg_ack = 1'b0;
end

accelerator_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .num_blocks(num_blocks)
);

accelerator_dataflow_in_loop_VITIS_LOOP_10_1 dataflow_in_loop_VITIS_LOOP_10_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .In_r_TDATA(In_r_TDATA),
    .Out_r_TDATA(dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TDATA),
    .Out_r_TKEEP(dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TKEEP),
    .Out_r_TSTRB(dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TSTRB),
    .Out_r_TLAST(dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TLAST),
    .In_r_TVALID(In_r_TVALID),
    .In_r_TREADY(dataflow_in_loop_VITIS_LOOP_10_1_U0_In_r_TREADY),
    .ap_start(dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_start),
    .Out_r_TVALID(dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TVALID),
    .Out_r_TREADY(Out_r_TREADY),
    .ap_done(dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_done),
    .ap_ready(dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_ready),
    .ap_idle(dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_idle),
    .ap_continue(dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_continue)
);

accelerator_ap_bound ap_bound_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(num_blocks),
    .if_full_n(ap_bound_full_n),
    .if_write(ap_bound_write),
    .if_dout(ap_bound_dout),
    .if_empty_n(ap_bound_empty_n),
    .if_read(ap_bound_read)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_bound_reg_ack <= 1'b0;
    end else begin
        if (((ap_internal_ready == 1'b0) & (ap_start == 1'b1))) begin
            ap_bound_reg_ack <= ap_bound_ack;
        end else begin
            ap_bound_reg_ack <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_loop_dataflow_input_count <= 32'd0;
    end else begin
        if ((~(ap_loop_dataflow_input_count == ap_bound_minus_1) & (ap_real_start == 1'b1) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_ready == 1'b1))) begin
            ap_loop_dataflow_input_count <= (ap_loop_dataflow_input_count + 32'd1);
        end else if (((ap_real_start == 1'b1) & (ap_loop_dataflow_input_count == ap_bound_minus_1) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_ready == 1'b1))) begin
            ap_loop_dataflow_input_count <= 32'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_loop_dataflow_output_count <= 32'd0;
    end else begin
        if ((~(ap_bound_dout <= 32'd0) & ~(ap_loop_dataflow_output_count == ap_bound_minus_1_output) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_continue == 1'b1) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_done == 1'b1) & (1'b1 == ap_bound_empty_n))) begin
            ap_loop_dataflow_output_count <= (ap_loop_dataflow_output_count + 32'd1);
        end else if ((~(ap_bound_dout <= 32'd0) & (ap_loop_dataflow_output_count == ap_bound_minus_1_output) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_continue == 1'b1) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_done == 1'b1) & (1'b1 == ap_bound_empty_n))) begin
            ap_loop_dataflow_output_count <= 32'd0;
        end
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b0 == ap_bound_reg_ack))) begin
        ap_bound_write = 1'b1;
    end else begin
        ap_bound_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_dataflow_output_count == 32'd0) & (ap_start == 1'b0) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_idle == 1'b1) & (1'b0 == ap_bound_empty_n))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_bound_empty_n) & ((32'd0 == ap_bound_dout) | ((ap_loop_dataflow_output_count == ap_bound_minus_1_output) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_done == 1'b1))))) begin
        ap_internal_done = 1'b1;
    end else begin
        ap_internal_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_partial_ready == 1'b1) | ((num_blocks <= 32'd0) & (ap_start == 1'b1)))) begin
        ap_internal_ready = 1'b1;
    end else begin
        ap_internal_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_real_start == 1'b1) & (ap_loop_dataflow_input_count == ap_bound_minus_1) & (dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_ready == 1'b1))) begin
        ap_partial_ready = 1'b1;
    end else begin
        ap_partial_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~(num_blocks <= 32'd0) & (ap_start == 1'b1) & (1'b1 == ap_bound_ack))) begin
        ap_real_start = 1'b1;
    end else begin
        ap_real_start = 1'b0;
    end
end

assign dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_continue = 1'b1;

assign In_r_TREADY = dataflow_in_loop_VITIS_LOOP_10_1_U0_In_r_TREADY;

assign Out_r_TDATA = dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TDATA;

assign Out_r_TKEEP = dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TKEEP;

assign Out_r_TLAST = dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TLAST;

assign Out_r_TSTRB = dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TSTRB;

assign Out_r_TVALID = dataflow_in_loop_VITIS_LOOP_10_1_U0_Out_r_TVALID;

assign ap_bound_ack = (ap_bound_reg_ack | ap_bound_full_n);

assign ap_bound_minus_1 = (num_blocks - 32'd1);

assign ap_bound_minus_1_output = (ap_bound_dout - 32'd1);

assign ap_bound_read = (ap_internal_done & ap_bound_empty_n);

assign ap_done = ap_internal_done;

assign ap_ready = ap_internal_ready;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign dataflow_in_loop_VITIS_LOOP_10_1_U0_ap_start = ap_real_start;


reg find_df_deadlock = 0;
// synthesis translate_off
`include "accelerator_hls_deadlock_detector.vh"
// synthesis translate_on

reg find_kernel_block = 0;
// synthesis translate_off
`include "accelerator_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //accelerator

