
`include "dump_file_agent.svh"
`include "csv_file_dump.svh"
`include "sample_agent.svh"
`include "loop_sample_agent.svh"
`include "sample_manager.svh"
`include "nodf_module_interface.svh"
`include "nodf_module_monitor.svh"
`include "df_process_interface.svh"
`include "df_process_monitor.svh"
`include "df_loop_interface.svh"
`include "df_loop_monitor.svh"
`include "upc_loop_interface.svh"
`include "upc_loop_monitor.svh"
`timescale 1ns/1ps

// top module for dataflow related monitors
module dataflow_monitor(
input logic clock,
input logic reset,
input logic finish
);


logic region_0_idle;
logic [31:0] region_0_start_cnt;
logic [31:0] region_0_done_cnt;
assign region_0_idle = (region_0_start_cnt == region_0_done_cnt) && AESL_inst_accelerator.ap_start == 1'b0 ;
always @(posedge clock) begin
    if (reset == 1'b1)
        region_0_start_cnt <= 32'h0;
    else if (AESL_inst_accelerator.ap_start == 1'b1 && AESL_inst_accelerator.ap_ready == 1'b1)
        region_0_start_cnt <= region_0_start_cnt + 32'h1;
    else;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        region_0_done_cnt <= 32'h0;
    else if (AESL_inst_accelerator.ap_done == 1'b1 && AESL_inst_accelerator.ap_continue == 1'b1)
        region_0_done_cnt <= region_0_done_cnt + 32'h1;
    else;
end

logic region_1_idle;
logic [31:0] region_1_start_cnt;
logic [31:0] region_1_done_cnt;
assign region_1_idle = (region_1_start_cnt == region_1_done_cnt) && AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_start == 1'b0 ;
always @(posedge clock) begin
    if (reset == 1'b1)
        region_1_start_cnt <= 32'h0;
    else if (AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_start == 1'b1 && AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_ready == 1'b1)
        region_1_start_cnt <= region_1_start_cnt + 32'h1;
    else;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        region_1_done_cnt <= 32'h0;
    else if (AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_done == 1'b1 && AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_continue == 1'b1)
        region_1_done_cnt <= region_1_done_cnt + 32'h1;
    else;
end


    df_process_intf process_intf_1(clock,reset);
    assign process_intf_1.ap_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_start;
    assign process_intf_1.ap_ready = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_ready;
    assign process_intf_1.ap_done = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_done;
    assign process_intf_1.ap_continue = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_continue;
    assign process_intf_1.real_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_start;
    assign process_intf_1.pin_stall = 1'b0;
    assign process_intf_1.pout_stall = 1'b0;
    assign process_intf_1.cin_stall = 1'b0;
    assign process_intf_1.cout_stall = 1'b0;
    assign process_intf_1.region_idle = region_0_idle;
    assign process_intf_1.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_1;
    csv_file_dump pstatus_csv_dumper_1;
    df_process_monitor process_monitor_1;
    df_process_intf process_intf_2(clock,reset);
    assign process_intf_2.ap_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.ap_start;
    assign process_intf_2.ap_ready = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.ap_ready;
    assign process_intf_2.ap_done = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.ap_done;
    assign process_intf_2.ap_continue = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.ap_continue;
    assign process_intf_2.real_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.ap_start;
    assign process_intf_2.pin_stall = 1'b0;
    assign process_intf_2.pout_stall = 1'b0;
    assign process_intf_2.cin_stall = 1'b0;
    assign process_intf_2.cout_stall = 1'b0 | ~AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.appear_V_U.i_full_n;
    assign process_intf_2.region_idle = region_1_idle;
    assign process_intf_2.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_2;
    csv_file_dump pstatus_csv_dumper_2;
    df_process_monitor process_monitor_2;
    df_process_intf process_intf_3(clock,reset);
    assign process_intf_3.ap_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.ap_start;
    assign process_intf_3.ap_ready = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.ap_ready;
    assign process_intf_3.ap_done = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.ap_done;
    assign process_intf_3.ap_continue = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.ap_continue;
    assign process_intf_3.real_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.ap_start;
    assign process_intf_3.pin_stall = 1'b0;
    assign process_intf_3.pout_stall = 1'b0;
    assign process_intf_3.cin_stall = 1'b0 | ~AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.appear_V_U.t_empty_n;
    assign process_intf_3.cout_stall = 1'b0;
    assign process_intf_3.region_idle = region_1_idle;
    assign process_intf_3.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_3;
    csv_file_dump pstatus_csv_dumper_3;
    df_process_monitor process_monitor_3;

    nodf_module_intf module_intf_1(clock,reset);
    assign module_intf_1.ap_start = AESL_inst_accelerator.ap_start;
    assign module_intf_1.ap_ready = AESL_inst_accelerator.ap_ready;
    assign module_intf_1.ap_done = AESL_inst_accelerator.ap_done;
    assign module_intf_1.ap_continue = AESL_inst_accelerator.ap_continue;
    assign module_intf_1.finish = finish;
    csv_file_dump mstatus_csv_dumper_1;
    nodf_module_monitor module_monitor_1;
    nodf_module_intf module_intf_2(clock,reset);
    assign module_intf_2.ap_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_start;
    assign module_intf_2.ap_ready = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_ready;
    assign module_intf_2.ap_done = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_done;
    assign module_intf_2.ap_continue = 1'b1;
    assign module_intf_2.finish = finish;
    csv_file_dump mstatus_csv_dumper_2;
    nodf_module_monitor module_monitor_2;
    nodf_module_intf module_intf_3(clock,reset);
    assign module_intf_3.ap_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_start;
    assign module_intf_3.ap_ready = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_ready;
    assign module_intf_3.ap_done = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_done;
    assign module_intf_3.ap_continue = 1'b1;
    assign module_intf_3.finish = finish;
    csv_file_dump mstatus_csv_dumper_3;
    nodf_module_monitor module_monitor_3;

    df_loop_intf df_loop_intf_1(clock,reset);
    assign df_loop_intf_1.body_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_start;
    assign df_loop_intf_1.body_ready = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_ready;
    assign df_loop_intf_1.body_done = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_done;
    assign df_loop_intf_1.body_continue = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.ap_continue;
    assign df_loop_intf_1.loop_start = AESL_inst_accelerator.ap_start;
    assign df_loop_intf_1.loop_ready = AESL_inst_accelerator.ap_ready;
    assign df_loop_intf_1.loop_done = AESL_inst_accelerator.ap_done;
    assign df_loop_intf_1.loop_continue = AESL_inst_accelerator.ap_continue;
    csv_file_dump df_loop_csv_dumper_1;
    df_loop_monitor df_loop_monitor_1;
    upc_loop_intf#(1) upc_loop_intf_1(clock,reset);
    assign upc_loop_intf_1.cur_state = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_CS_fsm;
    assign upc_loop_intf_1.iter_start_state = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.iter_end_state = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.quit_state = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.iter_start_block = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.iter_end_block = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.quit_block = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.iter_start_enable = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_1.iter_end_enable = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_enable_reg_pp0_iter3;
    assign upc_loop_intf_1.quit_enable = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_enable_reg_pp0_iter3;
    assign upc_loop_intf_1.loop_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_start;
    assign upc_loop_intf_1.loop_ready = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_ready;
    assign upc_loop_intf_1.loop_done = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.ap_done_int;
    assign upc_loop_intf_1.loop_continue = 1'b1;
    assign upc_loop_intf_1.quit_at_end = 1'b1;
    assign upc_loop_intf_1.finish = finish;
    csv_file_dump upc_loop_csv_dumper_1;
    upc_loop_monitor #(1) upc_loop_monitor_1;
    upc_loop_intf#(1) upc_loop_intf_2(clock,reset);
    assign upc_loop_intf_2.cur_state = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_CS_fsm;
    assign upc_loop_intf_2.iter_start_state = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.iter_end_state = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.quit_state = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.iter_start_block = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.iter_end_block = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.quit_block = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.iter_start_enable = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_2.iter_end_enable = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_2.quit_enable = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_2.loop_start = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_start;
    assign upc_loop_intf_2.loop_ready = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_ready;
    assign upc_loop_intf_2.loop_done = AESL_inst_accelerator.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.ap_done_int;
    assign upc_loop_intf_2.loop_continue = 1'b1;
    assign upc_loop_intf_2.quit_at_end = 1'b0;
    assign upc_loop_intf_2.finish = finish;
    csv_file_dump upc_loop_csv_dumper_2;
    upc_loop_monitor #(1) upc_loop_monitor_2;

    sample_manager sample_manager_inst;

initial begin
    sample_manager_inst = new;


    pstall_csv_dumper_1 = new("./stalling1.csv");
    pstatus_csv_dumper_1 = new("./status1.csv");
    process_monitor_1 = new(pstall_csv_dumper_1,process_intf_1,pstatus_csv_dumper_1);
    pstall_csv_dumper_2 = new("./stalling2.csv");
    pstatus_csv_dumper_2 = new("./status2.csv");
    process_monitor_2 = new(pstall_csv_dumper_2,process_intf_2,pstatus_csv_dumper_2);
    pstall_csv_dumper_3 = new("./stalling3.csv");
    pstatus_csv_dumper_3 = new("./status3.csv");
    process_monitor_3 = new(pstall_csv_dumper_3,process_intf_3,pstatus_csv_dumper_3);

    mstatus_csv_dumper_1 = new("./module_status1.csv");
    module_monitor_1 = new(module_intf_1,mstatus_csv_dumper_1);
    mstatus_csv_dumper_2 = new("./module_status2.csv");
    module_monitor_2 = new(module_intf_2,mstatus_csv_dumper_2);
    mstatus_csv_dumper_3 = new("./module_status3.csv");
    module_monitor_3 = new(module_intf_3,mstatus_csv_dumper_3);

    df_loop_csv_dumper_1 = new("./df_loop_status1.csv");
    df_loop_monitor_1 = new(df_loop_intf_1,df_loop_csv_dumper_1);



    upc_loop_csv_dumper_1 = new("./upc_loop_status1.csv");
    upc_loop_monitor_1 = new(upc_loop_intf_1,upc_loop_csv_dumper_1);
    upc_loop_csv_dumper_2 = new("./upc_loop_status2.csv");
    upc_loop_monitor_2 = new(upc_loop_intf_2,upc_loop_csv_dumper_2);

    sample_manager_inst.add_one_monitor(process_monitor_1);
    sample_manager_inst.add_one_monitor(process_monitor_2);
    sample_manager_inst.add_one_monitor(process_monitor_3);
    sample_manager_inst.add_one_monitor(module_monitor_1);
    sample_manager_inst.add_one_monitor(module_monitor_2);
    sample_manager_inst.add_one_monitor(module_monitor_3);
    sample_manager_inst.add_one_monitor(df_loop_monitor_1);
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
            if (finish == 1'b1 || deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock == 1'b1) begin
                @(negedge clock);
                break;
            end
            else
                @(posedge clock);
        end
    endtask


endmodule
