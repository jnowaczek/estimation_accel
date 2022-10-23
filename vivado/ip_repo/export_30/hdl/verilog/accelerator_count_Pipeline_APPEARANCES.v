// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module accelerator_count_Pipeline_APPEARANCES (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        In_r_TVALID,
        In_r_TDATA,
        In_r_TREADY,
        appear_address0,
        appear_ce0,
        appear_we0,
        appear_d0,
        appear_address1,
        appear_ce1,
        appear_q1,
        prev_out,
        prev_out_ap_vld,
        count_V_5_out,
        count_V_5_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   In_r_TVALID;
input  [7:0] In_r_TDATA;
output   In_r_TREADY;
output  [7:0] appear_address0;
output   appear_ce0;
output   appear_we0;
output  [2:0] appear_d0;
output  [7:0] appear_address1;
output   appear_ce1;
input  [2:0] appear_q1;
output  [7:0] prev_out;
output   prev_out_ap_vld;
output  [2:0] count_V_5_out;
output   count_V_5_out_ap_vld;

reg ap_idle;
reg In_r_TREADY;
reg appear_ce0;
reg appear_we0;
reg appear_ce1;
reg prev_out_ap_vld;
reg count_V_5_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire   [0:0] icmp_ln33_fu_126_p2;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    In_r_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln33_reg_285;
reg   [7:0] prev_2_reg_289;
wire   [0:0] icmp_ln37_fu_138_p2;
reg   [0:0] icmp_ln37_reg_297;
wire   [0:0] icmp_ln41_fu_158_p2;
reg   [0:0] icmp_ln41_reg_302;
wire   [31:0] zext_ln44_fu_167_p1;
wire   [31:0] zext_ln859_fu_172_p1;
reg   [2:0] lhs_fu_56;
wire   [2:0] count_V_2_fu_241_p3;
wire   [2:0] count_V_1_fu_200_p3;
reg   [2:0] ap_sig_allocacmp_lhs_load_1;
wire    ap_loop_init;
reg   [7:0] prev_fu_60;
reg   [10:0] i_fu_64;
wire   [10:0] i_3_fu_132_p2;
reg   [10:0] ap_sig_allocacmp_i_2;
reg    ap_block_pp0_stage0_01001;
wire   [7:0] prev_1_fu_152_p3;
wire   [3:0] zext_ln1393_fu_176_p1;
wire   [3:0] ret_V_fu_180_p2;
wire   [0:0] overflow_fu_192_p3;
wire   [2:0] count_V_fu_186_p2;
wire   [3:0] zext_ln1393_1_fu_217_p1;
wire   [3:0] ret_V_1_fu_221_p2;
wire   [0:0] overflow_1_fu_233_p3;
wire   [2:0] add_ln859_fu_227_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
reg    ap_block_pp0;
reg    ap_enable_operation_30;
reg    ap_enable_state2_pp0_iter1_stage0;
reg    ap_enable_operation_33;
reg    ap_enable_operation_43;
reg    ap_enable_state3_pp0_iter2_stage0;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_264;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

accelerator_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln33_fu_126_p2 == 1'd0) & (ap_start_int == 1'b1))) begin
            i_fu_64 <= i_3_fu_132_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_64 <= 11'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            lhs_fu_56 <= 3'd0;
        end else if ((1'b1 == ap_condition_264)) begin
            lhs_fu_56 <= count_V_1_fu_200_p3;
        end else if (((icmp_ln41_reg_302 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            lhs_fu_56 <= count_V_2_fu_241_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln33_reg_285 <= icmp_ln33_fu_126_p2;
        icmp_ln41_reg_302 <= icmp_ln41_fu_158_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln33_fu_126_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln37_reg_297 <= icmp_ln37_fu_138_p2;
        prev_2_reg_289 <= In_r_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        prev_fu_60 <= prev_2_reg_289;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln33_fu_126_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        In_r_TDATA_blk_n = In_r_TVALID;
    end else begin
        In_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln33_fu_126_p2 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        In_r_TREADY = 1'b1;
    end else begin
        In_r_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln33_fu_126_p2 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_2 = 11'd0;
    end else begin
        ap_sig_allocacmp_i_2 = i_fu_64;
    end
end

always @ (*) begin
    if (((icmp_ln41_reg_302 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_sig_allocacmp_lhs_load_1 = count_V_2_fu_241_p3;
    end else begin
        ap_sig_allocacmp_lhs_load_1 = lhs_fu_56;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        appear_ce0 = 1'b1;
    end else begin
        appear_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        appear_ce1 = 1'b1;
    end else begin
        appear_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln41_fu_158_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        appear_we0 = 1'b1;
    end else begin
        appear_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln33_reg_285 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        count_V_5_out_ap_vld = 1'b1;
    end else begin
        count_V_5_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln33_reg_285 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        prev_out_ap_vld = 1'b1;
    end else begin
        prev_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln859_fu_227_p2 = (appear_q1 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((icmp_ln33_fu_126_p2 == 1'd0) & (1'b0 == In_r_TVALID) & (ap_start_int == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((icmp_ln33_fu_126_p2 == 1'd0) & (1'b0 == In_r_TVALID) & (ap_start_int == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((icmp_ln33_fu_126_p2 == 1'd0) & (1'b0 == In_r_TVALID) & (ap_start_int == 1'b1));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((icmp_ln33_fu_126_p2 == 1'd0) & (1'b0 == In_r_TVALID));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_264 = ((icmp_ln41_fu_158_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_operation_30 = (icmp_ln41_fu_158_p2 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_33 = (icmp_ln41_fu_158_p2 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_43 = (icmp_ln41_reg_302 == 1'd0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

always @ (*) begin
    ap_enable_state2_pp0_iter1_stage0 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state3_pp0_iter2_stage0 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign appear_address0 = zext_ln44_fu_167_p1;

assign appear_address1 = zext_ln859_fu_172_p1;

assign appear_d0 = ap_sig_allocacmp_lhs_load_1;

assign count_V_1_fu_200_p3 = ((overflow_fu_192_p3[0:0] == 1'b1) ? 3'd7 : count_V_fu_186_p2);

assign count_V_2_fu_241_p3 = ((overflow_1_fu_233_p3[0:0] == 1'b1) ? 3'd7 : add_ln859_fu_227_p2);

assign count_V_5_out = lhs_fu_56;

assign count_V_fu_186_p2 = (ap_sig_allocacmp_lhs_load_1 + 3'd1);

assign i_3_fu_132_p2 = (ap_sig_allocacmp_i_2 + 11'd1);

assign icmp_ln33_fu_126_p2 = ((ap_sig_allocacmp_i_2 == 11'd1024) ? 1'b1 : 1'b0);

assign icmp_ln37_fu_138_p2 = ((ap_sig_allocacmp_i_2 == 11'd0) ? 1'b1 : 1'b0);

assign icmp_ln41_fu_158_p2 = ((prev_1_fu_152_p3 == prev_2_reg_289) ? 1'b1 : 1'b0);

assign overflow_1_fu_233_p3 = ret_V_1_fu_221_p2[32'd3];

assign overflow_fu_192_p3 = ret_V_fu_180_p2[32'd3];

assign prev_1_fu_152_p3 = ((icmp_ln37_reg_297[0:0] == 1'b1) ? prev_2_reg_289 : prev_fu_60);

assign prev_out = prev_fu_60;

assign ret_V_1_fu_221_p2 = (zext_ln1393_1_fu_217_p1 + 4'd1);

assign ret_V_fu_180_p2 = (zext_ln1393_fu_176_p1 + 4'd1);

assign zext_ln1393_1_fu_217_p1 = appear_q1;

assign zext_ln1393_fu_176_p1 = ap_sig_allocacmp_lhs_load_1;

assign zext_ln44_fu_167_p1 = prev_1_fu_152_p3;

assign zext_ln859_fu_172_p1 = prev_2_reg_289;

endmodule //accelerator_count_Pipeline_APPEARANCES
