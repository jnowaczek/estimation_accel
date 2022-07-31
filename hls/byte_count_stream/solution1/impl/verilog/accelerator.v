// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="accelerator_accelerator,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010i-clg225-1L,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=7.091000,HLS_SYN_LAT=1158,HLS_SYN_TPT=1159,HLS_SYN_MEM=2,HLS_SYN_DSP=0,HLS_SYN_FF=229,HLS_SYN_LUT=2521,HLS_VERSION=2022_1}" *)

module accelerator (
        ap_clk,
        ap_rst,
        In_r_dout,
        In_r_empty_n,
        In_r_read,
        Out_r_din,
        Out_r_full_n,
        Out_r_write,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


input   ap_clk;
input   ap_rst;
input  [7:0] In_r_dout;
input   In_r_empty_n;
output   In_r_read;
output  [31:0] Out_r_din;
input   Out_r_full_n;
output   Out_r_write;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

wire   [7:0] appear_i_q0;
wire   [7:0] appear_i_q1;
wire   [7:0] appear_t_q0;
wire   [7:0] appear_t_q1;
wire    count_U0_ap_start;
wire    count_U0_ap_done;
wire    count_U0_ap_continue;
wire    count_U0_ap_idle;
wire    count_U0_ap_ready;
wire    count_U0_In_r_read;
wire   [7:0] count_U0_appear_address0;
wire    count_U0_appear_ce0;
wire    count_U0_appear_we0;
wire   [7:0] count_U0_appear_d0;
wire   [7:0] count_U0_appear_address1;
wire    count_U0_appear_ce1;
wire    count_U0_appear_we1;
wire   [7:0] count_U0_appear_d1;
wire    threshold_U0_ap_start;
wire    threshold_U0_ap_done;
wire    threshold_U0_ap_continue;
wire    threshold_U0_ap_idle;
wire    threshold_U0_ap_ready;
wire   [7:0] threshold_U0_appear_address0;
wire    threshold_U0_appear_ce0;
wire   [31:0] threshold_U0_Out_r_din;
wire    threshold_U0_Out_r_write;
wire    appear_i_full_n;
wire    appear_t_empty_n;

accelerator_appear_RAM_AUTO_1R1W #(
    .DataWidth( 8 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
appear_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_address0(count_U0_appear_address0),
    .i_ce0(count_U0_appear_ce0),
    .i_we0(count_U0_appear_we0),
    .i_d0(count_U0_appear_d0),
    .i_q0(appear_i_q0),
    .i_address1(count_U0_appear_address1),
    .i_ce1(count_U0_appear_ce1),
    .i_we1(count_U0_appear_we1),
    .i_d1(count_U0_appear_d1),
    .i_q1(appear_i_q1),
    .t_address0(threshold_U0_appear_address0),
    .t_ce0(threshold_U0_appear_ce0),
    .t_we0(1'b0),
    .t_d0(8'd0),
    .t_q0(appear_t_q0),
    .t_address1(8'd0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_d1(8'd0),
    .t_q1(appear_t_q1),
    .i_ce(1'b1),
    .t_ce(1'b1),
    .i_full_n(appear_i_full_n),
    .i_write(count_U0_ap_done),
    .t_empty_n(appear_t_empty_n),
    .t_read(threshold_U0_ap_ready)
);

accelerator_count count_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(count_U0_ap_start),
    .ap_done(count_U0_ap_done),
    .ap_continue(count_U0_ap_continue),
    .ap_idle(count_U0_ap_idle),
    .ap_ready(count_U0_ap_ready),
    .In_r_dout(In_r_dout),
    .In_r_empty_n(In_r_empty_n),
    .In_r_read(count_U0_In_r_read),
    .appear_address0(count_U0_appear_address0),
    .appear_ce0(count_U0_appear_ce0),
    .appear_we0(count_U0_appear_we0),
    .appear_d0(count_U0_appear_d0),
    .appear_address1(count_U0_appear_address1),
    .appear_ce1(count_U0_appear_ce1),
    .appear_we1(count_U0_appear_we1),
    .appear_d1(count_U0_appear_d1),
    .appear_q1(appear_i_q1)
);

accelerator_threshold threshold_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(threshold_U0_ap_start),
    .ap_done(threshold_U0_ap_done),
    .ap_continue(threshold_U0_ap_continue),
    .ap_idle(threshold_U0_ap_idle),
    .ap_ready(threshold_U0_ap_ready),
    .appear_address0(threshold_U0_appear_address0),
    .appear_ce0(threshold_U0_appear_ce0),
    .appear_q0(appear_t_q0),
    .Out_r_din(threshold_U0_Out_r_din),
    .Out_r_full_n(Out_r_full_n),
    .Out_r_write(threshold_U0_Out_r_write)
);

assign In_r_read = count_U0_In_r_read;

assign Out_r_din = threshold_U0_Out_r_din;

assign Out_r_write = threshold_U0_Out_r_write;

assign ap_done = threshold_U0_ap_done;

assign ap_idle = (threshold_U0_ap_idle & (appear_t_empty_n ^ 1'b1) & count_U0_ap_idle);

assign ap_ready = count_U0_ap_ready;

assign count_U0_ap_continue = appear_i_full_n;

assign count_U0_ap_start = ap_start;

assign threshold_U0_ap_continue = ap_continue;

assign threshold_U0_ap_start = appear_t_empty_n;

endmodule //accelerator
