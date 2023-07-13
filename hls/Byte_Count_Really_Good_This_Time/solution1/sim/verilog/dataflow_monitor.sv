
`include "dump_file_agent.svh"
`include "csv_file_dump.svh"
`include "sample_agent.svh"
`include "loop_sample_agent.svh"
`include "sample_manager.svh"
`include "nodf_module_interface.svh"
`include "nodf_module_monitor.svh"
`include "df_fifo_interface.svh"
`include "df_fifo_monitor.svh"
`include "df_process_interface.svh"
`include "df_process_monitor.svh"
`include "upc_loop_interface.svh"
`include "upc_loop_monitor.svh"
`timescale 1ns/1ps

// top module for dataflow related monitors
module dataflow_monitor(
input logic clock,
input logic reset,
input logic finish
);

    df_fifo_intf fifo_intf_1(clock,reset);
    assign fifo_intf_1.rd_en = (AESL_inst_make_go_fast.split_U.if_out0_read & AESL_inst_make_go_fast.split_U.if_out0_empty_n) | (AESL_inst_make_go_fast.split_U.if_out1_read & AESL_inst_make_go_fast.split_U.if_out1_empty_n) | (AESL_inst_make_go_fast.split_U.if_out2_read & AESL_inst_make_go_fast.split_U.if_out2_empty_n) | (AESL_inst_make_go_fast.split_U.if_out3_read & AESL_inst_make_go_fast.split_U.if_out3_empty_n) | (AESL_inst_make_go_fast.split_U.if_out4_read & AESL_inst_make_go_fast.split_U.if_out4_empty_n) | (AESL_inst_make_go_fast.split_U.if_out5_read & AESL_inst_make_go_fast.split_U.if_out5_empty_n) | (AESL_inst_make_go_fast.split_U.if_out6_read & AESL_inst_make_go_fast.split_U.if_out6_empty_n) | (AESL_inst_make_go_fast.split_U.if_out7_read & AESL_inst_make_go_fast.split_U.if_out7_empty_n);
    assign fifo_intf_1.wr_en = (AESL_inst_make_go_fast.split_U.if_in0_write & AESL_inst_make_go_fast.split_U.if_in0_full_n);
    assign fifo_intf_1.fifo_rd_block = ~(AESL_inst_make_go_fast.KPN_U0.worker_1_U0.split_out_0_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_2_U0.split_out_1_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_3_U0.split_out_2_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_4_U0.split_out_3_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_5_U0.split_out_4_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_6_U0.split_out_5_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_7_U0.split_out_6_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_U0.split_out_7_blk_n);
    assign fifo_intf_1.fifo_wr_block = ~(AESL_inst_make_go_fast.read_in_U0.split_in_blk_n);
    assign fifo_intf_1.finish = finish;
    csv_file_dump fifo_csv_dumper_1;
    csv_file_dump cstatus_csv_dumper_1;
    df_fifo_monitor fifo_monitor_1;
    df_fifo_intf fifo_intf_2(clock,reset);
    assign fifo_intf_2.rd_en = (AESL_inst_make_go_fast.merge_U.if_out0_read & AESL_inst_make_go_fast.merge_U.if_out0_empty_n);
    assign fifo_intf_2.wr_en = (AESL_inst_make_go_fast.merge_U.if_in0_write & AESL_inst_make_go_fast.merge_U.if_in0_full_n) | (AESL_inst_make_go_fast.merge_U.if_in1_write & AESL_inst_make_go_fast.merge_U.if_in1_full_n) | (AESL_inst_make_go_fast.merge_U.if_in2_write & AESL_inst_make_go_fast.merge_U.if_in2_full_n) | (AESL_inst_make_go_fast.merge_U.if_in3_write & AESL_inst_make_go_fast.merge_U.if_in3_full_n) | (AESL_inst_make_go_fast.merge_U.if_in4_write & AESL_inst_make_go_fast.merge_U.if_in4_full_n) | (AESL_inst_make_go_fast.merge_U.if_in5_write & AESL_inst_make_go_fast.merge_U.if_in5_full_n) | (AESL_inst_make_go_fast.merge_U.if_in6_write & AESL_inst_make_go_fast.merge_U.if_in6_full_n) | (AESL_inst_make_go_fast.merge_U.if_in7_write & AESL_inst_make_go_fast.merge_U.if_in7_full_n);
    assign fifo_intf_2.fifo_rd_block = ~(AESL_inst_make_go_fast.write_out_U0.merge_out_blk_n);
    assign fifo_intf_2.fifo_wr_block = ~(AESL_inst_make_go_fast.KPN_U0.worker_1_U0.merge_in_0_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_2_U0.merge_in_1_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_3_U0.merge_in_2_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_4_U0.merge_in_3_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_5_U0.merge_in_4_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_6_U0.merge_in_5_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_7_U0.merge_in_6_blk_n | AESL_inst_make_go_fast.KPN_U0.worker_U0.merge_in_7_blk_n);
    assign fifo_intf_2.finish = finish;
    csv_file_dump fifo_csv_dumper_2;
    csv_file_dump cstatus_csv_dumper_2;
    df_fifo_monitor fifo_monitor_2;

logic region_0_idle;
logic [31:0] region_0_start_cnt;
logic [31:0] region_0_done_cnt;
assign region_0_idle = (region_0_start_cnt == region_0_done_cnt) && AESL_inst_make_go_fast.ap_start == 1'b0 ;
always @(posedge clock) begin
    if (reset == 1'b1)
        region_0_start_cnt <= 32'h0;
    else if (AESL_inst_make_go_fast.ap_start == 1'b1 && AESL_inst_make_go_fast.ap_ready == 1'b1)
        region_0_start_cnt <= region_0_start_cnt + 32'h1;
    else;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        region_0_done_cnt <= 32'h0;
    else if (AESL_inst_make_go_fast.ap_done == 1'b1)
        region_0_done_cnt <= region_0_done_cnt + 32'h1;
    else;
end

logic region_1_idle;
assign region_1_idle = 1'b0;


    df_process_intf process_intf_1(clock,reset);
    assign process_intf_1.ap_start = AESL_inst_make_go_fast.read_in_U0.ap_start;
    assign process_intf_1.ap_ready = AESL_inst_make_go_fast.read_in_U0.ap_ready;
    assign process_intf_1.ap_done = AESL_inst_make_go_fast.read_in_U0.ap_done;
    assign process_intf_1.ap_continue = AESL_inst_make_go_fast.read_in_U0.ap_continue;
    assign process_intf_1.real_start = AESL_inst_make_go_fast.read_in_U0.ap_start;
    assign process_intf_1.pin_stall = 1'b0;
    assign process_intf_1.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.read_in_U0.split_in_blk_n;
    assign process_intf_1.cin_stall = 1'b0;
    assign process_intf_1.cout_stall = 1'b0;
    assign process_intf_1.region_idle = region_0_idle;
    assign process_intf_1.finish = finish;
    csv_file_dump pstall_csv_dumper_1;
    csv_file_dump pstatus_csv_dumper_1;
    df_process_monitor process_monitor_1;
    df_process_intf process_intf_2(clock,reset);
    assign process_intf_2.ap_start = 1'b0;
    assign process_intf_2.ap_ready = AESL_inst_make_go_fast.KPN_U0.ap_ready;
    assign process_intf_2.ap_done = 1'b0;
    assign process_intf_2.ap_continue = 1'b0;
    assign process_intf_2.real_start = 1'b0;
    assign process_intf_2.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_1_U0.split_out_0_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_2_U0.split_out_1_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_3_U0.split_out_2_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_4_U0.split_out_3_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_5_U0.split_out_4_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_6_U0.split_out_5_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_7_U0.split_out_6_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_U0.split_out_7_blk_n;
    assign process_intf_2.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_1_U0.merge_in_0_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_2_U0.merge_in_1_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_3_U0.merge_in_2_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_4_U0.merge_in_3_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_5_U0.merge_in_4_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_6_U0.merge_in_5_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_7_U0.merge_in_6_blk_n | ~AESL_inst_make_go_fast.KPN_U0.worker_U0.merge_in_7_blk_n;
    assign process_intf_2.cin_stall = 1'b0;
    assign process_intf_2.cout_stall = 1'b0;
    assign process_intf_2.region_idle = region_0_idle;
    assign process_intf_2.finish = finish;
    csv_file_dump pstall_csv_dumper_2;
    csv_file_dump pstatus_csv_dumper_2;
    df_process_monitor process_monitor_2;
    df_process_intf process_intf_3(clock,reset);
    assign process_intf_3.ap_start = AESL_inst_make_go_fast.KPN_U0.worker_1_U0.ap_start;
    assign process_intf_3.ap_ready = AESL_inst_make_go_fast.KPN_U0.worker_1_U0.ap_ready;
    assign process_intf_3.ap_done = AESL_inst_make_go_fast.KPN_U0.worker_1_U0.ap_done;
    assign process_intf_3.ap_continue = AESL_inst_make_go_fast.KPN_U0.worker_1_U0.ap_continue;
    assign process_intf_3.real_start = AESL_inst_make_go_fast.KPN_U0.worker_1_U0.ap_start;
    assign process_intf_3.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_1_U0.split_out_0_blk_n;
    assign process_intf_3.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_1_U0.merge_in_0_blk_n;
    assign process_intf_3.cin_stall = 1'b0;
    assign process_intf_3.cout_stall = 1'b0;
    assign process_intf_3.region_idle = region_1_idle;
    assign process_intf_3.finish = finish;
    csv_file_dump pstall_csv_dumper_3;
    csv_file_dump pstatus_csv_dumper_3;
    df_process_monitor process_monitor_3;
    df_process_intf process_intf_4(clock,reset);
    assign process_intf_4.ap_start = AESL_inst_make_go_fast.KPN_U0.worker_2_U0.ap_start;
    assign process_intf_4.ap_ready = AESL_inst_make_go_fast.KPN_U0.worker_2_U0.ap_ready;
    assign process_intf_4.ap_done = AESL_inst_make_go_fast.KPN_U0.worker_2_U0.ap_done;
    assign process_intf_4.ap_continue = AESL_inst_make_go_fast.KPN_U0.worker_2_U0.ap_continue;
    assign process_intf_4.real_start = AESL_inst_make_go_fast.KPN_U0.worker_2_U0.ap_start;
    assign process_intf_4.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_2_U0.split_out_1_blk_n;
    assign process_intf_4.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_2_U0.merge_in_1_blk_n;
    assign process_intf_4.cin_stall = 1'b0;
    assign process_intf_4.cout_stall = 1'b0;
    assign process_intf_4.region_idle = region_1_idle;
    assign process_intf_4.finish = finish;
    csv_file_dump pstall_csv_dumper_4;
    csv_file_dump pstatus_csv_dumper_4;
    df_process_monitor process_monitor_4;
    df_process_intf process_intf_5(clock,reset);
    assign process_intf_5.ap_start = AESL_inst_make_go_fast.KPN_U0.worker_3_U0.ap_start;
    assign process_intf_5.ap_ready = AESL_inst_make_go_fast.KPN_U0.worker_3_U0.ap_ready;
    assign process_intf_5.ap_done = AESL_inst_make_go_fast.KPN_U0.worker_3_U0.ap_done;
    assign process_intf_5.ap_continue = AESL_inst_make_go_fast.KPN_U0.worker_3_U0.ap_continue;
    assign process_intf_5.real_start = AESL_inst_make_go_fast.KPN_U0.worker_3_U0.ap_start;
    assign process_intf_5.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_3_U0.split_out_2_blk_n;
    assign process_intf_5.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_3_U0.merge_in_2_blk_n;
    assign process_intf_5.cin_stall = 1'b0;
    assign process_intf_5.cout_stall = 1'b0;
    assign process_intf_5.region_idle = region_1_idle;
    assign process_intf_5.finish = finish;
    csv_file_dump pstall_csv_dumper_5;
    csv_file_dump pstatus_csv_dumper_5;
    df_process_monitor process_monitor_5;
    df_process_intf process_intf_6(clock,reset);
    assign process_intf_6.ap_start = AESL_inst_make_go_fast.KPN_U0.worker_4_U0.ap_start;
    assign process_intf_6.ap_ready = AESL_inst_make_go_fast.KPN_U0.worker_4_U0.ap_ready;
    assign process_intf_6.ap_done = AESL_inst_make_go_fast.KPN_U0.worker_4_U0.ap_done;
    assign process_intf_6.ap_continue = AESL_inst_make_go_fast.KPN_U0.worker_4_U0.ap_continue;
    assign process_intf_6.real_start = AESL_inst_make_go_fast.KPN_U0.worker_4_U0.ap_start;
    assign process_intf_6.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_4_U0.split_out_3_blk_n;
    assign process_intf_6.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_4_U0.merge_in_3_blk_n;
    assign process_intf_6.cin_stall = 1'b0;
    assign process_intf_6.cout_stall = 1'b0;
    assign process_intf_6.region_idle = region_1_idle;
    assign process_intf_6.finish = finish;
    csv_file_dump pstall_csv_dumper_6;
    csv_file_dump pstatus_csv_dumper_6;
    df_process_monitor process_monitor_6;
    df_process_intf process_intf_7(clock,reset);
    assign process_intf_7.ap_start = AESL_inst_make_go_fast.KPN_U0.worker_5_U0.ap_start;
    assign process_intf_7.ap_ready = AESL_inst_make_go_fast.KPN_U0.worker_5_U0.ap_ready;
    assign process_intf_7.ap_done = AESL_inst_make_go_fast.KPN_U0.worker_5_U0.ap_done;
    assign process_intf_7.ap_continue = AESL_inst_make_go_fast.KPN_U0.worker_5_U0.ap_continue;
    assign process_intf_7.real_start = AESL_inst_make_go_fast.KPN_U0.worker_5_U0.ap_start;
    assign process_intf_7.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_5_U0.split_out_4_blk_n;
    assign process_intf_7.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_5_U0.merge_in_4_blk_n;
    assign process_intf_7.cin_stall = 1'b0;
    assign process_intf_7.cout_stall = 1'b0;
    assign process_intf_7.region_idle = region_1_idle;
    assign process_intf_7.finish = finish;
    csv_file_dump pstall_csv_dumper_7;
    csv_file_dump pstatus_csv_dumper_7;
    df_process_monitor process_monitor_7;
    df_process_intf process_intf_8(clock,reset);
    assign process_intf_8.ap_start = AESL_inst_make_go_fast.KPN_U0.worker_6_U0.ap_start;
    assign process_intf_8.ap_ready = AESL_inst_make_go_fast.KPN_U0.worker_6_U0.ap_ready;
    assign process_intf_8.ap_done = AESL_inst_make_go_fast.KPN_U0.worker_6_U0.ap_done;
    assign process_intf_8.ap_continue = AESL_inst_make_go_fast.KPN_U0.worker_6_U0.ap_continue;
    assign process_intf_8.real_start = AESL_inst_make_go_fast.KPN_U0.worker_6_U0.ap_start;
    assign process_intf_8.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_6_U0.split_out_5_blk_n;
    assign process_intf_8.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_6_U0.merge_in_5_blk_n;
    assign process_intf_8.cin_stall = 1'b0;
    assign process_intf_8.cout_stall = 1'b0;
    assign process_intf_8.region_idle = region_1_idle;
    assign process_intf_8.finish = finish;
    csv_file_dump pstall_csv_dumper_8;
    csv_file_dump pstatus_csv_dumper_8;
    df_process_monitor process_monitor_8;
    df_process_intf process_intf_9(clock,reset);
    assign process_intf_9.ap_start = AESL_inst_make_go_fast.KPN_U0.worker_7_U0.ap_start;
    assign process_intf_9.ap_ready = AESL_inst_make_go_fast.KPN_U0.worker_7_U0.ap_ready;
    assign process_intf_9.ap_done = AESL_inst_make_go_fast.KPN_U0.worker_7_U0.ap_done;
    assign process_intf_9.ap_continue = AESL_inst_make_go_fast.KPN_U0.worker_7_U0.ap_continue;
    assign process_intf_9.real_start = AESL_inst_make_go_fast.KPN_U0.worker_7_U0.ap_start;
    assign process_intf_9.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_7_U0.split_out_6_blk_n;
    assign process_intf_9.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_7_U0.merge_in_6_blk_n;
    assign process_intf_9.cin_stall = 1'b0;
    assign process_intf_9.cout_stall = 1'b0;
    assign process_intf_9.region_idle = region_1_idle;
    assign process_intf_9.finish = finish;
    csv_file_dump pstall_csv_dumper_9;
    csv_file_dump pstatus_csv_dumper_9;
    df_process_monitor process_monitor_9;
    df_process_intf process_intf_10(clock,reset);
    assign process_intf_10.ap_start = AESL_inst_make_go_fast.KPN_U0.worker_U0.ap_start;
    assign process_intf_10.ap_ready = AESL_inst_make_go_fast.KPN_U0.worker_U0.ap_ready;
    assign process_intf_10.ap_done = AESL_inst_make_go_fast.KPN_U0.worker_U0.ap_done;
    assign process_intf_10.ap_continue = AESL_inst_make_go_fast.KPN_U0.worker_U0.ap_continue;
    assign process_intf_10.real_start = AESL_inst_make_go_fast.KPN_U0.worker_U0.ap_start;
    assign process_intf_10.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_U0.split_out_7_blk_n;
    assign process_intf_10.pout_stall = 1'b0 | ~AESL_inst_make_go_fast.KPN_U0.worker_U0.merge_in_7_blk_n;
    assign process_intf_10.cin_stall = 1'b0;
    assign process_intf_10.cout_stall = 1'b0;
    assign process_intf_10.region_idle = region_1_idle;
    assign process_intf_10.finish = finish;
    csv_file_dump pstall_csv_dumper_10;
    csv_file_dump pstatus_csv_dumper_10;
    df_process_monitor process_monitor_10;
    df_process_intf process_intf_11(clock,reset);
    assign process_intf_11.ap_start = AESL_inst_make_go_fast.write_out_U0.ap_start;
    assign process_intf_11.ap_ready = AESL_inst_make_go_fast.write_out_U0.ap_ready;
    assign process_intf_11.ap_done = AESL_inst_make_go_fast.write_out_U0.ap_done;
    assign process_intf_11.ap_continue = AESL_inst_make_go_fast.write_out_U0.ap_continue;
    assign process_intf_11.real_start = AESL_inst_make_go_fast.write_out_U0.ap_start;
    assign process_intf_11.pin_stall = 1'b0 | ~AESL_inst_make_go_fast.write_out_U0.merge_out_blk_n;
    assign process_intf_11.pout_stall = 1'b0;
    assign process_intf_11.cin_stall = 1'b0;
    assign process_intf_11.cout_stall = 1'b0;
    assign process_intf_11.region_idle = region_0_idle;
    assign process_intf_11.finish = finish;
    csv_file_dump pstall_csv_dumper_11;
    csv_file_dump pstatus_csv_dumper_11;
    df_process_monitor process_monitor_11;

    nodf_module_intf module_intf_1(clock,reset);
    assign module_intf_1.ap_start = AESL_inst_make_go_fast.ap_start;
    assign module_intf_1.ap_ready = AESL_inst_make_go_fast.ap_ready;
    assign module_intf_1.ap_done = AESL_inst_make_go_fast.ap_done;
    assign module_intf_1.ap_continue = 1'b1;
    assign module_intf_1.finish = finish;
    csv_file_dump mstatus_csv_dumper_1;
    nodf_module_monitor module_monitor_1;

    upc_loop_intf#(1) upc_loop_intf_1(clock,reset);
    assign upc_loop_intf_1.cur_state = AESL_inst_make_go_fast.read_in_U0.ap_CS_fsm;
    assign upc_loop_intf_1.iter_start_state = AESL_inst_make_go_fast.read_in_U0.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.iter_end_state = AESL_inst_make_go_fast.read_in_U0.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.quit_state = AESL_inst_make_go_fast.read_in_U0.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.iter_start_block = AESL_inst_make_go_fast.read_in_U0.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.iter_end_block = AESL_inst_make_go_fast.read_in_U0.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.quit_block = AESL_inst_make_go_fast.read_in_U0.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.iter_start_enable = AESL_inst_make_go_fast.read_in_U0.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_1.iter_end_enable = AESL_inst_make_go_fast.read_in_U0.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_1.quit_enable = AESL_inst_make_go_fast.read_in_U0.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_1.loop_start = AESL_inst_make_go_fast.read_in_U0.ap_start;
    assign upc_loop_intf_1.loop_ready = AESL_inst_make_go_fast.read_in_U0.ap_ready;
    assign upc_loop_intf_1.loop_done = AESL_inst_make_go_fast.read_in_U0.ap_done;
    assign upc_loop_intf_1.loop_continue = AESL_inst_make_go_fast.read_in_U0.ap_continue;
    assign upc_loop_intf_1.quit_at_end = 1'b1;
    assign upc_loop_intf_1.finish = finish;
    csv_file_dump upc_loop_csv_dumper_1;
    upc_loop_monitor #(1) upc_loop_monitor_1;
    upc_loop_intf#(1) upc_loop_intf_2(clock,reset);
    assign upc_loop_intf_2.cur_state = AESL_inst_make_go_fast.write_out_U0.ap_CS_fsm;
    assign upc_loop_intf_2.iter_start_state = AESL_inst_make_go_fast.write_out_U0.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.iter_end_state = AESL_inst_make_go_fast.write_out_U0.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.quit_state = AESL_inst_make_go_fast.write_out_U0.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.iter_start_block = AESL_inst_make_go_fast.write_out_U0.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.iter_end_block = AESL_inst_make_go_fast.write_out_U0.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.quit_block = AESL_inst_make_go_fast.write_out_U0.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.iter_start_enable = AESL_inst_make_go_fast.write_out_U0.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_2.iter_end_enable = AESL_inst_make_go_fast.write_out_U0.ap_enable_reg_pp0_iter2;
    assign upc_loop_intf_2.quit_enable = AESL_inst_make_go_fast.write_out_U0.ap_enable_reg_pp0_iter2;
    assign upc_loop_intf_2.loop_start = AESL_inst_make_go_fast.write_out_U0.ap_start;
    assign upc_loop_intf_2.loop_ready = AESL_inst_make_go_fast.write_out_U0.ap_ready;
    assign upc_loop_intf_2.loop_done = AESL_inst_make_go_fast.write_out_U0.ap_done;
    assign upc_loop_intf_2.loop_continue = AESL_inst_make_go_fast.write_out_U0.ap_continue;
    assign upc_loop_intf_2.quit_at_end = 1'b1;
    assign upc_loop_intf_2.finish = finish;
    csv_file_dump upc_loop_csv_dumper_2;
    upc_loop_monitor #(1) upc_loop_monitor_2;

    sample_manager sample_manager_inst;

initial begin
    sample_manager_inst = new;

    fifo_csv_dumper_1 = new("./depth1.csv");
    cstatus_csv_dumper_1 = new("./chan_status1.csv");
    fifo_monitor_1 = new(fifo_csv_dumper_1,fifo_intf_1,cstatus_csv_dumper_1);
    fifo_csv_dumper_2 = new("./depth2.csv");
    cstatus_csv_dumper_2 = new("./chan_status2.csv");
    fifo_monitor_2 = new(fifo_csv_dumper_2,fifo_intf_2,cstatus_csv_dumper_2);

    pstall_csv_dumper_1 = new("./stalling1.csv");
    pstatus_csv_dumper_1 = new("./status1.csv");
    process_monitor_1 = new(pstall_csv_dumper_1,process_intf_1,pstatus_csv_dumper_1);
    pstall_csv_dumper_2 = new("./stalling2.csv");
    pstatus_csv_dumper_2 = new("./status2.csv");
    process_monitor_2 = new(pstall_csv_dumper_2,process_intf_2,pstatus_csv_dumper_2);
    pstall_csv_dumper_3 = new("./stalling3.csv");
    pstatus_csv_dumper_3 = new("./status3.csv");
    process_monitor_3 = new(pstall_csv_dumper_3,process_intf_3,pstatus_csv_dumper_3);
    pstall_csv_dumper_4 = new("./stalling4.csv");
    pstatus_csv_dumper_4 = new("./status4.csv");
    process_monitor_4 = new(pstall_csv_dumper_4,process_intf_4,pstatus_csv_dumper_4);
    pstall_csv_dumper_5 = new("./stalling5.csv");
    pstatus_csv_dumper_5 = new("./status5.csv");
    process_monitor_5 = new(pstall_csv_dumper_5,process_intf_5,pstatus_csv_dumper_5);
    pstall_csv_dumper_6 = new("./stalling6.csv");
    pstatus_csv_dumper_6 = new("./status6.csv");
    process_monitor_6 = new(pstall_csv_dumper_6,process_intf_6,pstatus_csv_dumper_6);
    pstall_csv_dumper_7 = new("./stalling7.csv");
    pstatus_csv_dumper_7 = new("./status7.csv");
    process_monitor_7 = new(pstall_csv_dumper_7,process_intf_7,pstatus_csv_dumper_7);
    pstall_csv_dumper_8 = new("./stalling8.csv");
    pstatus_csv_dumper_8 = new("./status8.csv");
    process_monitor_8 = new(pstall_csv_dumper_8,process_intf_8,pstatus_csv_dumper_8);
    pstall_csv_dumper_9 = new("./stalling9.csv");
    pstatus_csv_dumper_9 = new("./status9.csv");
    process_monitor_9 = new(pstall_csv_dumper_9,process_intf_9,pstatus_csv_dumper_9);
    pstall_csv_dumper_10 = new("./stalling10.csv");
    pstatus_csv_dumper_10 = new("./status10.csv");
    process_monitor_10 = new(pstall_csv_dumper_10,process_intf_10,pstatus_csv_dumper_10);
    pstall_csv_dumper_11 = new("./stalling11.csv");
    pstatus_csv_dumper_11 = new("./status11.csv");
    process_monitor_11 = new(pstall_csv_dumper_11,process_intf_11,pstatus_csv_dumper_11);

    mstatus_csv_dumper_1 = new("./module_status1.csv");
    module_monitor_1 = new(module_intf_1,mstatus_csv_dumper_1);




    upc_loop_csv_dumper_1 = new("./upc_loop_status1.csv");
    upc_loop_monitor_1 = new(upc_loop_intf_1,upc_loop_csv_dumper_1);
    upc_loop_csv_dumper_2 = new("./upc_loop_status2.csv");
    upc_loop_monitor_2 = new(upc_loop_intf_2,upc_loop_csv_dumper_2);

    sample_manager_inst.add_one_monitor(fifo_monitor_1);
    sample_manager_inst.add_one_monitor(fifo_monitor_2);
    sample_manager_inst.add_one_monitor(process_monitor_1);
    sample_manager_inst.add_one_monitor(process_monitor_2);
    sample_manager_inst.add_one_monitor(process_monitor_3);
    sample_manager_inst.add_one_monitor(process_monitor_4);
    sample_manager_inst.add_one_monitor(process_monitor_5);
    sample_manager_inst.add_one_monitor(process_monitor_6);
    sample_manager_inst.add_one_monitor(process_monitor_7);
    sample_manager_inst.add_one_monitor(process_monitor_8);
    sample_manager_inst.add_one_monitor(process_monitor_9);
    sample_manager_inst.add_one_monitor(process_monitor_10);
    sample_manager_inst.add_one_monitor(process_monitor_11);
    sample_manager_inst.add_one_monitor(module_monitor_1);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_1);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_2);
    
    fork
        sample_manager_inst.start_monitor();
        last_transaction_done;
    join
    disable fork;

    sample_manager_inst.start_dump();
end

    task last_transaction_done();
        wait(reset == 0);
        while(1) begin
            if (finish == 1'b1) begin
                @(negedge clock);
                break;
            end
            else
                @(posedge clock);
        end
    endtask


endmodule
