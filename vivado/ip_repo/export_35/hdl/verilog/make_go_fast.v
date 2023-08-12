// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="make_go_fast_make_go_fast,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=3.538000,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=1,HLS_SYN_DSP=0,HLS_SYN_FF=225,HLS_SYN_LUT=246,HLS_VERSION=2022_1}" *)

module make_go_fast (
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
        interrupt,
        InStream_TDATA,
        InStream_TKEEP,
        InStream_TSTRB,
        InStream_TLAST,
        OutStream_TDATA,
        OutStream_TKEEP,
        OutStream_TSTRB,
        OutStream_TLAST,
        InStream_TVALID,
        InStream_TREADY,
        OutStream_TVALID,
        OutStream_TREADY
);

parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 4;
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
output   interrupt;
input  [7:0] InStream_TDATA;
input  [0:0] InStream_TKEEP;
input  [0:0] InStream_TSTRB;
input  [0:0] InStream_TLAST;
output  [7:0] OutStream_TDATA;
output  [0:0] OutStream_TKEEP;
output  [0:0] OutStream_TSTRB;
output  [0:0] OutStream_TLAST;
input   InStream_TVALID;
output   InStream_TREADY;
output   OutStream_TVALID;
input   OutStream_TREADY;

 reg    ap_rst_n_inv;
wire    ap_start;
wire    ap_ready;
wire    ap_done;
wire    ap_idle;
wire    split_input_stream_U0_ap_start;
wire    split_input_stream_U0_ap_done;
wire    split_input_stream_U0_ap_continue;
wire    split_input_stream_U0_ap_idle;
wire    split_input_stream_U0_ap_ready;
wire    split_input_stream_U0_start_out;
wire    split_input_stream_U0_start_write;
wire    split_input_stream_U0_InStream_TREADY;
wire   [8:0] split_input_stream_U0_split_buffer_din;
wire    split_input_stream_U0_split_buffer_write;
wire    process_split_stream_U0_ap_start;
wire    process_split_stream_U0_ap_done;
wire    process_split_stream_U0_ap_continue;
wire    process_split_stream_U0_ap_idle;
wire    process_split_stream_U0_ap_ready;
wire    process_split_stream_U0_split_buffer_read;
wire   [7:0] process_split_stream_U0_OutStream_TDATA;
wire    process_split_stream_U0_OutStream_TVALID;
wire   [0:0] process_split_stream_U0_OutStream_TKEEP;
wire   [0:0] process_split_stream_U0_OutStream_TSTRB;
wire   [0:0] process_split_stream_U0_OutStream_TLAST;
wire    split_buffer_full_n;
wire   [8:0] split_buffer_dout;
wire   [8:0] split_buffer_num_data_valid;
wire   [8:0] split_buffer_fifo_cap;
wire    split_buffer_empty_n;
wire   [0:0] start_for_process_split_stream_U0_din;
wire    start_for_process_split_stream_U0_full_n;
wire   [0:0] start_for_process_split_stream_U0_dout;
wire    start_for_process_split_stream_U0_empty_n;

make_go_fast_control_s_axi #(
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
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

make_go_fast_split_input_stream split_input_stream_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(split_input_stream_U0_ap_start),
    .start_full_n(start_for_process_split_stream_U0_full_n),
    .ap_done(split_input_stream_U0_ap_done),
    .ap_continue(split_input_stream_U0_ap_continue),
    .ap_idle(split_input_stream_U0_ap_idle),
    .ap_ready(split_input_stream_U0_ap_ready),
    .start_out(split_input_stream_U0_start_out),
    .start_write(split_input_stream_U0_start_write),
    .InStream_TDATA(InStream_TDATA),
    .InStream_TVALID(InStream_TVALID),
    .InStream_TREADY(split_input_stream_U0_InStream_TREADY),
    .InStream_TKEEP(InStream_TKEEP),
    .InStream_TSTRB(InStream_TSTRB),
    .InStream_TLAST(InStream_TLAST),
    .split_buffer_din(split_input_stream_U0_split_buffer_din),
    .split_buffer_num_data_valid(split_buffer_num_data_valid),
    .split_buffer_fifo_cap(split_buffer_fifo_cap),
    .split_buffer_full_n(split_buffer_full_n),
    .split_buffer_write(split_input_stream_U0_split_buffer_write)
);

make_go_fast_process_split_stream process_split_stream_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(process_split_stream_U0_ap_start),
    .ap_done(process_split_stream_U0_ap_done),
    .ap_continue(process_split_stream_U0_ap_continue),
    .ap_idle(process_split_stream_U0_ap_idle),
    .ap_ready(process_split_stream_U0_ap_ready),
    .split_buffer_dout(split_buffer_dout),
    .split_buffer_num_data_valid(split_buffer_num_data_valid),
    .split_buffer_fifo_cap(split_buffer_fifo_cap),
    .split_buffer_empty_n(split_buffer_empty_n),
    .split_buffer_read(process_split_stream_U0_split_buffer_read),
    .OutStream_TDATA(process_split_stream_U0_OutStream_TDATA),
    .OutStream_TVALID(process_split_stream_U0_OutStream_TVALID),
    .OutStream_TREADY(OutStream_TREADY),
    .OutStream_TKEEP(process_split_stream_U0_OutStream_TKEEP),
    .OutStream_TSTRB(process_split_stream_U0_OutStream_TSTRB),
    .OutStream_TLAST(process_split_stream_U0_OutStream_TLAST)
);

make_go_fast_fifo_w9_d256_A split_buffer_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(split_input_stream_U0_split_buffer_din),
    .if_full_n(split_buffer_full_n),
    .if_write(split_input_stream_U0_split_buffer_write),
    .if_dout(split_buffer_dout),
    .if_num_data_valid(split_buffer_num_data_valid),
    .if_fifo_cap(split_buffer_fifo_cap),
    .if_empty_n(split_buffer_empty_n),
    .if_read(process_split_stream_U0_split_buffer_read)
);

make_go_fast_start_for_process_split_stream_U0 start_for_process_split_stream_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_process_split_stream_U0_din),
    .if_full_n(start_for_process_split_stream_U0_full_n),
    .if_write(split_input_stream_U0_start_write),
    .if_dout(start_for_process_split_stream_U0_dout),
    .if_empty_n(start_for_process_split_stream_U0_empty_n),
    .if_read(process_split_stream_U0_ap_ready)
);

assign InStream_TREADY = split_input_stream_U0_InStream_TREADY;

assign OutStream_TDATA = process_split_stream_U0_OutStream_TDATA;

assign OutStream_TKEEP = process_split_stream_U0_OutStream_TKEEP;

assign OutStream_TLAST = process_split_stream_U0_OutStream_TLAST;

assign OutStream_TSTRB = process_split_stream_U0_OutStream_TSTRB;

assign OutStream_TVALID = process_split_stream_U0_OutStream_TVALID;

assign ap_done = process_split_stream_U0_ap_done;

assign ap_idle = (split_input_stream_U0_ap_idle & process_split_stream_U0_ap_idle);

assign ap_ready = split_input_stream_U0_ap_ready;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign process_split_stream_U0_ap_continue = 1'b1;

assign process_split_stream_U0_ap_start = start_for_process_split_stream_U0_empty_n;

assign split_input_stream_U0_ap_continue = 1'b1;

assign split_input_stream_U0_ap_start = ap_start;

assign start_for_process_split_stream_U0_din = 1'b1;


reg find_df_deadlock = 0;
// synthesis translate_off
`include "make_go_fast_hls_deadlock_detector.vh"
// synthesis translate_on

reg find_kernel_block = 0;
// synthesis translate_off
`include "make_go_fast_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //make_go_fast
