// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module accelerator_threshold (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        appear_address0,
        appear_ce0,
        appear_q0,
        Out_r_TDATA,
        Out_r_TVALID,
        Out_r_TREADY,
        Out_r_TKEEP,
        Out_r_TSTRB,
        Out_r_TLAST
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [7:0] appear_address0;
output   appear_ce0;
input  [2:0] appear_q0;
output  [7:0] Out_r_TDATA;
output   Out_r_TVALID;
input   Out_r_TREADY;
output  [0:0] Out_r_TKEEP;
output  [0:0] Out_r_TSTRB;
output  [0:0] Out_r_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg Out_r_TVALID;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    Out_r_TDATA_blk_n;
wire    ap_CS_fsm_state3;
wire    grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start;
wire    grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_done;
wire    grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_idle;
wire    grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_ready;
wire   [7:0] grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_appear_address0;
wire    grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_appear_ce0;
wire   [7:0] grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_over_thresh_out;
wire    grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_over_thresh_out_ap_vld;
reg    grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start_reg;
reg    ap_block_state1_ignore_call2;
wire    ap_CS_fsm_state2;
reg   [7:0] over_thresh_loc_fu_32;
wire    ap_CS_fsm_state4;
reg   [3:0] ap_NS_fsm;
reg    ap_block_state1;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start_reg = 1'b0;
end

accelerator_threshold_Pipeline_VITIS_LOOP_58_1 grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start),
    .ap_done(grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_done),
    .ap_idle(grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_idle),
    .ap_ready(grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_ready),
    .appear_address0(grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_appear_address0),
    .appear_ce0(grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_appear_ce0),
    .appear_q0(appear_q0),
    .over_thresh_out(grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_over_thresh_out),
    .over_thresh_out_ap_vld(grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_over_thresh_out_ap_vld)
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
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start_reg <= 1'b0;
    end else begin
        if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start_reg <= 1'b1;
        end else if ((grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_ready == 1'b1)) begin
            grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_over_thresh_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        over_thresh_loc_fu_32 <= grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_over_thresh_out;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        Out_r_TDATA_blk_n = Out_r_TREADY;
    end else begin
        Out_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == Out_r_TREADY))) begin
        Out_r_TVALID = 1'b1;
    end else begin
        Out_r_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Out_r_TREADY)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == Out_r_TREADY))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Out_r_TDATA = over_thresh_loc_fu_32;

assign Out_r_TKEEP = 1'd0;

assign Out_r_TLAST = 1'd1;

assign Out_r_TSTRB = 1'd0;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state1_ignore_call2 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign appear_address0 = grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_appear_address0;

assign appear_ce0 = grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_appear_ce0;

assign grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start = grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55_ap_start_reg;

endmodule //accelerator_threshold
