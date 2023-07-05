// ==============================================================
// Generated by Vitis HLS v2023.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module make_go_fast_KPN (
        split_out_0_dout,
        split_out_0_empty_n,
        split_out_0_read,
        merge_in_0_din,
        merge_in_0_full_n,
        merge_in_0_write,
        split_out_1_dout,
        split_out_1_empty_n,
        split_out_1_read,
        merge_in_1_din,
        merge_in_1_full_n,
        merge_in_1_write,
        split_out_2_dout,
        split_out_2_empty_n,
        split_out_2_read,
        merge_in_2_din,
        merge_in_2_full_n,
        merge_in_2_write,
        split_out_3_dout,
        split_out_3_empty_n,
        split_out_3_read,
        merge_in_3_din,
        merge_in_3_full_n,
        merge_in_3_write,
        split_out_4_dout,
        split_out_4_empty_n,
        split_out_4_read,
        merge_in_4_din,
        merge_in_4_full_n,
        merge_in_4_write,
        split_out_5_dout,
        split_out_5_empty_n,
        split_out_5_read,
        merge_in_5_din,
        merge_in_5_full_n,
        merge_in_5_write,
        split_out_6_dout,
        split_out_6_empty_n,
        split_out_6_read,
        merge_in_6_din,
        merge_in_6_full_n,
        merge_in_6_write,
        split_out_7_dout,
        split_out_7_empty_n,
        split_out_7_read,
        merge_in_7_din,
        merge_in_7_full_n,
        merge_in_7_write,
        ap_clk,
        ap_rst,
        ap_ready
);


input  [7:0] split_out_0_dout;
input   split_out_0_empty_n;
output   split_out_0_read;
output  [7:0] merge_in_0_din;
input   merge_in_0_full_n;
output   merge_in_0_write;
input  [7:0] split_out_1_dout;
input   split_out_1_empty_n;
output   split_out_1_read;
output  [7:0] merge_in_1_din;
input   merge_in_1_full_n;
output   merge_in_1_write;
input  [7:0] split_out_2_dout;
input   split_out_2_empty_n;
output   split_out_2_read;
output  [7:0] merge_in_2_din;
input   merge_in_2_full_n;
output   merge_in_2_write;
input  [7:0] split_out_3_dout;
input   split_out_3_empty_n;
output   split_out_3_read;
output  [7:0] merge_in_3_din;
input   merge_in_3_full_n;
output   merge_in_3_write;
input  [7:0] split_out_4_dout;
input   split_out_4_empty_n;
output   split_out_4_read;
output  [7:0] merge_in_4_din;
input   merge_in_4_full_n;
output   merge_in_4_write;
input  [7:0] split_out_5_dout;
input   split_out_5_empty_n;
output   split_out_5_read;
output  [7:0] merge_in_5_din;
input   merge_in_5_full_n;
output   merge_in_5_write;
input  [7:0] split_out_6_dout;
input   split_out_6_empty_n;
output   split_out_6_read;
output  [7:0] merge_in_6_din;
input   merge_in_6_full_n;
output   merge_in_6_write;
input  [7:0] split_out_7_dout;
input   split_out_7_empty_n;
output   split_out_7_read;
output  [7:0] merge_in_7_din;
input   merge_in_7_full_n;
output   merge_in_7_write;
input   ap_clk;
input   ap_rst;
output   ap_ready;

wire    worker_1_U0_ap_start;
wire    worker_1_U0_ap_done;
wire    worker_1_U0_ap_continue;
wire    worker_1_U0_ap_idle;
wire    worker_1_U0_ap_ready;
wire    worker_1_U0_split_out_0_read;
wire   [7:0] worker_1_U0_merge_in_0_din;
wire    worker_1_U0_merge_in_0_write;
wire    worker_2_U0_ap_start;
wire    worker_2_U0_ap_done;
wire    worker_2_U0_ap_continue;
wire    worker_2_U0_ap_idle;
wire    worker_2_U0_ap_ready;
wire    worker_2_U0_split_out_1_read;
wire   [7:0] worker_2_U0_merge_in_1_din;
wire    worker_2_U0_merge_in_1_write;
wire    worker_3_U0_ap_start;
wire    worker_3_U0_ap_done;
wire    worker_3_U0_ap_continue;
wire    worker_3_U0_ap_idle;
wire    worker_3_U0_ap_ready;
wire    worker_3_U0_split_out_2_read;
wire   [7:0] worker_3_U0_merge_in_2_din;
wire    worker_3_U0_merge_in_2_write;
wire    worker_4_U0_ap_start;
wire    worker_4_U0_ap_done;
wire    worker_4_U0_ap_continue;
wire    worker_4_U0_ap_idle;
wire    worker_4_U0_ap_ready;
wire    worker_4_U0_split_out_3_read;
wire   [7:0] worker_4_U0_merge_in_3_din;
wire    worker_4_U0_merge_in_3_write;
wire    worker_5_U0_ap_start;
wire    worker_5_U0_ap_done;
wire    worker_5_U0_ap_continue;
wire    worker_5_U0_ap_idle;
wire    worker_5_U0_ap_ready;
wire    worker_5_U0_split_out_4_read;
wire   [7:0] worker_5_U0_merge_in_4_din;
wire    worker_5_U0_merge_in_4_write;
wire    worker_6_U0_ap_start;
wire    worker_6_U0_ap_done;
wire    worker_6_U0_ap_continue;
wire    worker_6_U0_ap_idle;
wire    worker_6_U0_ap_ready;
wire    worker_6_U0_split_out_5_read;
wire   [7:0] worker_6_U0_merge_in_5_din;
wire    worker_6_U0_merge_in_5_write;
wire    worker_7_U0_ap_start;
wire    worker_7_U0_ap_done;
wire    worker_7_U0_ap_continue;
wire    worker_7_U0_ap_idle;
wire    worker_7_U0_ap_ready;
wire    worker_7_U0_split_out_6_read;
wire   [7:0] worker_7_U0_merge_in_6_din;
wire    worker_7_U0_merge_in_6_write;
wire    worker_U0_ap_start;
wire    worker_U0_ap_done;
wire    worker_U0_ap_continue;
wire    worker_U0_ap_idle;
wire    worker_U0_ap_ready;
wire    worker_U0_split_out_7_read;
wire   [7:0] worker_U0_merge_in_7_din;
wire    worker_U0_merge_in_7_write;

make_go_fast_worker_1 worker_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(worker_1_U0_ap_start),
    .ap_done(worker_1_U0_ap_done),
    .ap_continue(worker_1_U0_ap_continue),
    .ap_idle(worker_1_U0_ap_idle),
    .ap_ready(worker_1_U0_ap_ready),
    .split_out_0_dout(split_out_0_dout),
    .split_out_0_empty_n(split_out_0_empty_n),
    .split_out_0_read(worker_1_U0_split_out_0_read),
    .merge_in_0_din(worker_1_U0_merge_in_0_din),
    .merge_in_0_full_n(merge_in_0_full_n),
    .merge_in_0_write(worker_1_U0_merge_in_0_write)
);

make_go_fast_worker_2 worker_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(worker_2_U0_ap_start),
    .ap_done(worker_2_U0_ap_done),
    .ap_continue(worker_2_U0_ap_continue),
    .ap_idle(worker_2_U0_ap_idle),
    .ap_ready(worker_2_U0_ap_ready),
    .split_out_1_dout(split_out_1_dout),
    .split_out_1_empty_n(split_out_1_empty_n),
    .split_out_1_read(worker_2_U0_split_out_1_read),
    .merge_in_1_din(worker_2_U0_merge_in_1_din),
    .merge_in_1_full_n(merge_in_1_full_n),
    .merge_in_1_write(worker_2_U0_merge_in_1_write)
);

make_go_fast_worker_3 worker_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(worker_3_U0_ap_start),
    .ap_done(worker_3_U0_ap_done),
    .ap_continue(worker_3_U0_ap_continue),
    .ap_idle(worker_3_U0_ap_idle),
    .ap_ready(worker_3_U0_ap_ready),
    .split_out_2_dout(split_out_2_dout),
    .split_out_2_empty_n(split_out_2_empty_n),
    .split_out_2_read(worker_3_U0_split_out_2_read),
    .merge_in_2_din(worker_3_U0_merge_in_2_din),
    .merge_in_2_full_n(merge_in_2_full_n),
    .merge_in_2_write(worker_3_U0_merge_in_2_write)
);

make_go_fast_worker_4 worker_4_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(worker_4_U0_ap_start),
    .ap_done(worker_4_U0_ap_done),
    .ap_continue(worker_4_U0_ap_continue),
    .ap_idle(worker_4_U0_ap_idle),
    .ap_ready(worker_4_U0_ap_ready),
    .split_out_3_dout(split_out_3_dout),
    .split_out_3_empty_n(split_out_3_empty_n),
    .split_out_3_read(worker_4_U0_split_out_3_read),
    .merge_in_3_din(worker_4_U0_merge_in_3_din),
    .merge_in_3_full_n(merge_in_3_full_n),
    .merge_in_3_write(worker_4_U0_merge_in_3_write)
);

make_go_fast_worker_5 worker_5_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(worker_5_U0_ap_start),
    .ap_done(worker_5_U0_ap_done),
    .ap_continue(worker_5_U0_ap_continue),
    .ap_idle(worker_5_U0_ap_idle),
    .ap_ready(worker_5_U0_ap_ready),
    .split_out_4_dout(split_out_4_dout),
    .split_out_4_empty_n(split_out_4_empty_n),
    .split_out_4_read(worker_5_U0_split_out_4_read),
    .merge_in_4_din(worker_5_U0_merge_in_4_din),
    .merge_in_4_full_n(merge_in_4_full_n),
    .merge_in_4_write(worker_5_U0_merge_in_4_write)
);

make_go_fast_worker_6 worker_6_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(worker_6_U0_ap_start),
    .ap_done(worker_6_U0_ap_done),
    .ap_continue(worker_6_U0_ap_continue),
    .ap_idle(worker_6_U0_ap_idle),
    .ap_ready(worker_6_U0_ap_ready),
    .split_out_5_dout(split_out_5_dout),
    .split_out_5_empty_n(split_out_5_empty_n),
    .split_out_5_read(worker_6_U0_split_out_5_read),
    .merge_in_5_din(worker_6_U0_merge_in_5_din),
    .merge_in_5_full_n(merge_in_5_full_n),
    .merge_in_5_write(worker_6_U0_merge_in_5_write)
);

make_go_fast_worker_7 worker_7_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(worker_7_U0_ap_start),
    .ap_done(worker_7_U0_ap_done),
    .ap_continue(worker_7_U0_ap_continue),
    .ap_idle(worker_7_U0_ap_idle),
    .ap_ready(worker_7_U0_ap_ready),
    .split_out_6_dout(split_out_6_dout),
    .split_out_6_empty_n(split_out_6_empty_n),
    .split_out_6_read(worker_7_U0_split_out_6_read),
    .merge_in_6_din(worker_7_U0_merge_in_6_din),
    .merge_in_6_full_n(merge_in_6_full_n),
    .merge_in_6_write(worker_7_U0_merge_in_6_write)
);

make_go_fast_worker worker_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(worker_U0_ap_start),
    .ap_done(worker_U0_ap_done),
    .ap_continue(worker_U0_ap_continue),
    .ap_idle(worker_U0_ap_idle),
    .ap_ready(worker_U0_ap_ready),
    .split_out_7_dout(split_out_7_dout),
    .split_out_7_empty_n(split_out_7_empty_n),
    .split_out_7_read(worker_U0_split_out_7_read),
    .merge_in_7_din(worker_U0_merge_in_7_din),
    .merge_in_7_full_n(merge_in_7_full_n),
    .merge_in_7_write(worker_U0_merge_in_7_write)
);

assign ap_ready = 1'b1;

assign merge_in_0_din = worker_1_U0_merge_in_0_din;

assign merge_in_0_write = worker_1_U0_merge_in_0_write;

assign merge_in_1_din = worker_2_U0_merge_in_1_din;

assign merge_in_1_write = worker_2_U0_merge_in_1_write;

assign merge_in_2_din = worker_3_U0_merge_in_2_din;

assign merge_in_2_write = worker_3_U0_merge_in_2_write;

assign merge_in_3_din = worker_4_U0_merge_in_3_din;

assign merge_in_3_write = worker_4_U0_merge_in_3_write;

assign merge_in_4_din = worker_5_U0_merge_in_4_din;

assign merge_in_4_write = worker_5_U0_merge_in_4_write;

assign merge_in_5_din = worker_6_U0_merge_in_5_din;

assign merge_in_5_write = worker_6_U0_merge_in_5_write;

assign merge_in_6_din = worker_7_U0_merge_in_6_din;

assign merge_in_6_write = worker_7_U0_merge_in_6_write;

assign merge_in_7_din = worker_U0_merge_in_7_din;

assign merge_in_7_write = worker_U0_merge_in_7_write;

assign split_out_0_read = worker_1_U0_split_out_0_read;

assign split_out_1_read = worker_2_U0_split_out_1_read;

assign split_out_2_read = worker_3_U0_split_out_2_read;

assign split_out_3_read = worker_4_U0_split_out_3_read;

assign split_out_4_read = worker_5_U0_split_out_4_read;

assign split_out_5_read = worker_6_U0_split_out_5_read;

assign split_out_6_read = worker_7_U0_split_out_6_read;

assign split_out_7_read = worker_U0_split_out_7_read;

assign worker_1_U0_ap_continue = 1'b1;

assign worker_1_U0_ap_start = 1'b1;

assign worker_2_U0_ap_continue = 1'b1;

assign worker_2_U0_ap_start = 1'b1;

assign worker_3_U0_ap_continue = 1'b1;

assign worker_3_U0_ap_start = 1'b1;

assign worker_4_U0_ap_continue = 1'b1;

assign worker_4_U0_ap_start = 1'b1;

assign worker_5_U0_ap_continue = 1'b1;

assign worker_5_U0_ap_start = 1'b1;

assign worker_6_U0_ap_continue = 1'b1;

assign worker_6_U0_ap_start = 1'b1;

assign worker_7_U0_ap_continue = 1'b1;

assign worker_7_U0_ap_start = 1'b1;

assign worker_U0_ap_continue = 1'b1;

assign worker_U0_ap_start = 1'b1;

endmodule //make_go_fast_KPN
