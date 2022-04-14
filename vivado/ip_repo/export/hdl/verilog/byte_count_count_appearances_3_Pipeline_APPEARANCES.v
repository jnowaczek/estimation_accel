// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module byte_count_count_appearances_3_Pipeline_APPEARANCES (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        prev,
        input_r_address0,
        input_r_ce0,
        input_r_q0,
        appearances_address0,
        appearances_ce0,
        appearances_we0,
        appearances_d0,
        appearances_address1,
        appearances_ce1,
        appearances_q1,
        prev_1_out,
        prev_1_out_ap_vld,
        count_out,
        count_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] prev;
output  [7:0] input_r_address0;
output   input_r_ce0;
input  [7:0] input_r_q0;
output  [7:0] appearances_address0;
output   appearances_ce0;
output   appearances_we0;
output  [31:0] appearances_d0;
output  [7:0] appearances_address1;
output   appearances_ce1;
input  [31:0] appearances_q1;
output  [7:0] prev_1_out;
output   prev_1_out_ap_vld;
output  [31:0] count_out;
output   count_out_ap_vld;

reg ap_idle;
reg input_r_ce0;
reg appearances_ce0;
reg appearances_we0;
reg appearances_ce1;
reg prev_1_out_ap_vld;
reg count_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln62_fu_132_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln62_reg_231;
reg   [0:0] icmp_ln62_reg_231_pp0_iter1_reg;
reg   [7:0] prev_3_reg_240;
wire   [0:0] icmp_ln66_fu_157_p2;
reg   [0:0] icmp_ln66_reg_247;
wire   [63:0] zext_ln62_fu_144_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln69_fu_166_p1;
wire   [63:0] zext_ln70_fu_171_p1;
reg   [7:0] prev_1_fu_44;
wire    ap_loop_init;
reg   [8:0] i_fu_48;
wire   [8:0] add_ln62_fu_138_p2;
reg   [8:0] ap_sig_allocacmp_i_3;
reg   [31:0] count_fu_52;
wire   [31:0] count_2_fu_187_p2;
reg   [31:0] ap_sig_allocacmp_count_load_1;
reg   [31:0] ap_sig_allocacmp_count_load_2;
wire    ap_block_pp0_stage0_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
reg    ap_block_pp0;
reg    ap_enable_operation_34;
reg    ap_enable_state3_pp0_iter2_stage0;
reg    ap_enable_operation_37;
reg    ap_enable_operation_39;
reg    ap_enable_state4_pp0_iter3_stage0;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

byte_count_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            count_fu_52 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            count_fu_52 <= count_2_fu_187_p2;
        end else if (((icmp_ln66_reg_247 == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            count_fu_52 <= appearances_q1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln62_fu_132_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_48 <= add_ln62_fu_138_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_48 <= 9'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            prev_1_fu_44 <= prev;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            prev_1_fu_44 <= prev_3_reg_240;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln62_reg_231 <= icmp_ln62_fu_132_p2;
        icmp_ln62_reg_231_pp0_iter1_reg <= icmp_ln62_reg_231;
        prev_3_reg_240 <= input_r_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln66_reg_247 <= icmp_ln66_fu_157_p2;
    end
end

always @ (*) begin
    if (((icmp_ln62_fu_132_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_sig_allocacmp_count_load_1 = count_2_fu_187_p2;
    end else begin
        ap_sig_allocacmp_count_load_1 = count_fu_52;
    end
end

always @ (*) begin
    if (((icmp_ln66_reg_247 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_sig_allocacmp_count_load_2 = appearances_q1;
    end else begin
        ap_sig_allocacmp_count_load_2 = count_fu_52;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_3 = 9'd0;
    end else begin
        ap_sig_allocacmp_i_3 = i_fu_48;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        appearances_ce0 = 1'b1;
    end else begin
        appearances_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        appearances_ce1 = 1'b1;
    end else begin
        appearances_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln66_fu_157_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        appearances_we0 = 1'b1;
    end else begin
        appearances_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln62_reg_231_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        count_out_ap_vld = 1'b1;
    end else begin
        count_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        input_r_ce0 = 1'b1;
    end else begin
        input_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln62_reg_231_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        prev_1_out_ap_vld = 1'b1;
    end else begin
        prev_1_out_ap_vld = 1'b0;
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

assign add_ln62_fu_138_p2 = (ap_sig_allocacmp_i_3 + 9'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_enable_operation_34 = (icmp_ln66_fu_157_p2 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_37 = (icmp_ln66_fu_157_p2 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_39 = (icmp_ln66_reg_247 == 1'd0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

always @ (*) begin
    ap_enable_state3_pp0_iter2_stage0 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state4_pp0_iter3_stage0 = ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign appearances_address0 = zext_ln69_fu_166_p1;

assign appearances_address1 = zext_ln70_fu_171_p1;

assign appearances_d0 = ap_sig_allocacmp_count_load_1;

assign count_2_fu_187_p2 = (ap_sig_allocacmp_count_load_2 + 32'd1);

assign count_out = count_fu_52;

assign icmp_ln62_fu_132_p2 = ((ap_sig_allocacmp_i_3 == 9'd256) ? 1'b1 : 1'b0);

assign icmp_ln66_fu_157_p2 = ((prev_1_fu_44 == prev_3_reg_240) ? 1'b1 : 1'b0);

assign input_r_address0 = zext_ln62_fu_144_p1;

assign prev_1_out = prev_1_fu_44;

assign zext_ln62_fu_144_p1 = ap_sig_allocacmp_i_3;

assign zext_ln69_fu_166_p1 = prev_1_fu_44;

assign zext_ln70_fu_171_p1 = prev_3_reg_240;

endmodule //byte_count_count_appearances_3_Pipeline_APPEARANCES
