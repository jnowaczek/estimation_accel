
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [1:0] axis_block_sigs;
wire [4:0] inst_idle_sigs;
wire [1:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~split_input_stream_U0.InStream_TDATA_blk_n;
assign axis_block_sigs[1] = ~process_split_stream_U0.OutStream_TDATA_blk_n;

assign inst_idle_sigs[0] = split_input_stream_U0.ap_idle;
assign inst_block_sigs[0] = (split_input_stream_U0.ap_done & ~split_input_stream_U0.ap_continue) | ~split_input_stream_U0.grp_split_input_stream_Pipeline_VITIS_LOOP_16_1_fu_46.split_buffer_blk_n;
assign inst_idle_sigs[1] = process_split_stream_U0.ap_idle;
assign inst_block_sigs[1] = (process_split_stream_U0.ap_done & ~process_split_stream_U0.ap_continue) | ~process_split_stream_U0.split_buffer_blk_n;

assign inst_idle_sigs[2] = 1'b0;
assign inst_idle_sigs[3] = split_input_stream_U0.ap_idle;
assign inst_idle_sigs[4] = process_split_stream_U0.ap_idle;

make_go_fast_hls_deadlock_idx0_monitor make_go_fast_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
