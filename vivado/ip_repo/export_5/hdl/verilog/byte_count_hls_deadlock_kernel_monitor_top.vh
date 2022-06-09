
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [0:0] axis_block_sigs;
wire [10:0] inst_idle_sigs;
wire [8:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~split_U0.input_r_TDATA_blk_n;

assign inst_idle_sigs[0] = split_U0.ap_idle;
assign inst_block_sigs[0] = (split_U0.ap_done & ~split_U0.ap_continue);
assign inst_idle_sigs[1] = count_appearances_1_U0.ap_idle;
assign inst_block_sigs[1] = (count_appearances_1_U0.ap_done & ~count_appearances_1_U0.ap_continue);
assign inst_idle_sigs[2] = count_appearances_2_U0.ap_idle;
assign inst_block_sigs[2] = (count_appearances_2_U0.ap_done & ~count_appearances_2_U0.ap_continue);
assign inst_idle_sigs[3] = count_appearances_3_U0.ap_idle;
assign inst_block_sigs[3] = (count_appearances_3_U0.ap_done & ~count_appearances_3_U0.ap_continue);
assign inst_idle_sigs[4] = count_appearances_U0.ap_idle;
assign inst_block_sigs[4] = (count_appearances_U0.ap_done & ~count_appearances_U0.ap_continue);
assign inst_idle_sigs[5] = reduce_appearances_U0.ap_idle;
assign inst_block_sigs[5] = (reduce_appearances_U0.ap_done & ~reduce_appearances_U0.ap_continue);
assign inst_idle_sigs[6] = count_threshold_U0.ap_idle;
assign inst_block_sigs[6] = (count_threshold_U0.ap_done & ~count_threshold_U0.ap_continue);
assign inst_idle_sigs[7] = Block_entry211_proc_U0.ap_idle;
assign inst_block_sigs[7] = (Block_entry211_proc_U0.ap_done & ~Block_entry211_proc_U0.ap_continue);
assign inst_idle_sigs[8] = Block_entry_proc_proc_U0.ap_idle;
assign inst_block_sigs[8] = (Block_entry_proc_proc_U0.ap_done & ~Block_entry_proc_proc_U0.ap_continue);

assign inst_idle_sigs[9] = 1'b0;
assign inst_idle_sigs[10] = split_U0.ap_idle;

byte_count_hls_deadlock_idx0_monitor byte_count_hls_deadlock_idx0_monitor_U (
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
