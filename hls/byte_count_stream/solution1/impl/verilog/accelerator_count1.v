// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module accelerator_count1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        in_r_address0,
        in_r_ce0,
        in_r_q0,
        in_r_empty_n,
        in_r_read,
        out_r,
        out_r_write,
        out_r_full_n
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [8:0] in_r_address0;
output   in_r_ce0;
input  [7:0] in_r_q0;
input   in_r_empty_n;
output   in_r_read;
output  [2047:0] out_r;
output   out_r_write;
input   out_r_full_n;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[8:0] in_r_address0;
reg in_r_ce0;
reg in_r_read;
reg out_r_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] prev_reg_188;
wire    ap_CS_fsm_state2;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_ap_start;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_ap_done;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_ap_idle;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_ap_ready;
wire   [8:0] grp_count1_Pipeline_APPEARANCES_fu_99_in_r_address0;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_in_r_ce0;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_in_r_read;
wire   [2047:0] grp_count1_Pipeline_APPEARANCES_fu_99_p_out;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_p_out_ap_vld;
wire   [7:0] grp_count1_Pipeline_APPEARANCES_fu_99_prev_02_out;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_prev_02_out_ap_vld;
wire   [7:0] grp_count1_Pipeline_APPEARANCES_fu_99_count_01_out;
wire    grp_count1_Pipeline_APPEARANCES_fu_99_count_01_out_ap_vld;
reg    grp_count1_Pipeline_APPEARANCES_fu_99_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
reg    ap_block_state1;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 6'd1;
#0 grp_count1_Pipeline_APPEARANCES_fu_99_ap_start_reg = 1'b0;
end

accelerator_count1_Pipeline_APPEARANCES grp_count1_Pipeline_APPEARANCES_fu_99(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_count1_Pipeline_APPEARANCES_fu_99_ap_start),
    .ap_done(grp_count1_Pipeline_APPEARANCES_fu_99_ap_done),
    .ap_idle(grp_count1_Pipeline_APPEARANCES_fu_99_ap_idle),
    .ap_ready(grp_count1_Pipeline_APPEARANCES_fu_99_ap_ready),
    .prev(prev_reg_188),
    .in_r_address0(grp_count1_Pipeline_APPEARANCES_fu_99_in_r_address0),
    .in_r_ce0(grp_count1_Pipeline_APPEARANCES_fu_99_in_r_ce0),
    .in_r_q0(in_r_q0),
    .in_r_empty_n(in_r_empty_n),
    .in_r_read(grp_count1_Pipeline_APPEARANCES_fu_99_in_r_read),
    .p_out(grp_count1_Pipeline_APPEARANCES_fu_99_p_out),
    .p_out_ap_vld(grp_count1_Pipeline_APPEARANCES_fu_99_p_out_ap_vld),
    .prev_02_out(grp_count1_Pipeline_APPEARANCES_fu_99_prev_02_out),
    .prev_02_out_ap_vld(grp_count1_Pipeline_APPEARANCES_fu_99_prev_02_out_ap_vld),
    .count_01_out(grp_count1_Pipeline_APPEARANCES_fu_99_count_01_out),
    .count_01_out_ap_vld(grp_count1_Pipeline_APPEARANCES_fu_99_count_01_out_ap_vld)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((out_r_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_count1_Pipeline_APPEARANCES_fu_99_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_count1_Pipeline_APPEARANCES_fu_99_ap_start_reg <= 1'b1;
        end else if ((grp_count1_Pipeline_APPEARANCES_fu_99_ap_ready == 1'b1)) begin
            grp_count1_Pipeline_APPEARANCES_fu_99_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        prev_reg_188 <= in_r_q0;
    end
end

always @ (*) begin
    if (((in_r_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_count1_Pipeline_APPEARANCES_fu_99_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((out_r_full_n == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((out_r_full_n == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if (((out_r_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((out_r_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_r_address0 = 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        in_r_address0 = grp_count1_Pipeline_APPEARANCES_fu_99_in_r_address0;
    end else begin
        in_r_address0 = 'bx;
    end
end

always @ (*) begin
    if ((~((in_r_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_r_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        in_r_ce0 = grp_count1_Pipeline_APPEARANCES_fu_99_in_r_ce0;
    end else begin
        in_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((out_r_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
        in_r_read = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        in_r_read = grp_count1_Pipeline_APPEARANCES_fu_99_in_r_read;
    end else begin
        in_r_read = 1'b0;
    end
end

always @ (*) begin
    if ((((out_r_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | ((out_r_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6)))) begin
        out_r_write = 1'b1;
    end else begin
        out_r_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((in_r_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_count1_Pipeline_APPEARANCES_fu_99_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((out_r_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((out_r_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state1 = ((in_r_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign grp_count1_Pipeline_APPEARANCES_fu_99_ap_start = grp_count1_Pipeline_APPEARANCES_fu_99_ap_start_reg;

assign out_r = 2048'd0;

endmodule //accelerator_count1
