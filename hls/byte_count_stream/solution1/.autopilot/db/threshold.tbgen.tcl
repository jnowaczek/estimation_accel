set moduleName threshold
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {threshold}
set C_modelType { void 0 }
set C_modelArgList {
	{ appear_V1 int 3 regular {array 256 { 1 3 } 1 1 }  }
	{ Out_r_V_data_V int 8 regular {axi_s 1 volatile  { Out_r Data } }  }
	{ Out_r_V_keep_V int 1 regular {axi_s 1 volatile  { Out_r Keep } }  }
	{ Out_r_V_strb_V int 1 regular {axi_s 1 volatile  { Out_r Strb } }  }
	{ Out_r_V_user_V int 1 regular {axi_s 1 volatile  { Out_r User } }  }
	{ Out_r_V_last_V int 1 regular {axi_s 1 volatile  { Out_r Last } }  }
	{ Out_r_V_id_V int 1 regular {axi_s 1 volatile  { Out_r ID } }  }
	{ Out_r_V_dest_V int 1 regular {axi_s 1 volatile  { Out_r Dest } }  }
	{ counter int 32 regular {fifo 0}  }
	{ num_blocks int 32 regular {fifo 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "appear_V1", "interface" : "memory", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "Out_r_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "counter", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "num_blocks", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ appear_V1_address0 sc_out sc_lv 8 signal 0 } 
	{ appear_V1_ce0 sc_out sc_logic 1 signal 0 } 
	{ appear_V1_q0 sc_in sc_lv 3 signal 0 } 
	{ Out_r_TDATA sc_out sc_lv 8 signal 1 } 
	{ Out_r_TVALID sc_out sc_logic 1 outvld 7 } 
	{ Out_r_TREADY sc_in sc_logic 1 outacc 1 } 
	{ Out_r_TKEEP sc_out sc_lv 1 signal 2 } 
	{ Out_r_TSTRB sc_out sc_lv 1 signal 3 } 
	{ Out_r_TUSER sc_out sc_lv 1 signal 4 } 
	{ Out_r_TLAST sc_out sc_lv 1 signal 5 } 
	{ Out_r_TID sc_out sc_lv 1 signal 6 } 
	{ Out_r_TDEST sc_out sc_lv 1 signal 7 } 
	{ counter_dout sc_in sc_lv 32 signal 8 } 
	{ counter_num_data_valid sc_in sc_lv 3 signal 8 } 
	{ counter_fifo_cap sc_in sc_lv 3 signal 8 } 
	{ counter_empty_n sc_in sc_logic 1 signal 8 } 
	{ counter_read sc_out sc_logic 1 signal 8 } 
	{ num_blocks_dout sc_in sc_lv 32 signal 9 } 
	{ num_blocks_num_data_valid sc_in sc_lv 3 signal 9 } 
	{ num_blocks_fifo_cap sc_in sc_lv 3 signal 9 } 
	{ num_blocks_empty_n sc_in sc_logic 1 signal 9 } 
	{ num_blocks_read sc_out sc_logic 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "appear_V1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "appear_V1", "role": "address0" }} , 
 	{ "name": "appear_V1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appear_V1", "role": "ce0" }} , 
 	{ "name": "appear_V1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "appear_V1", "role": "q0" }} , 
 	{ "name": "Out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "Out_r_V_data_V", "role": "default" }} , 
 	{ "name": "Out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Out_r_V_dest_V", "role": "default" }} , 
 	{ "name": "Out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "Out_r_V_data_V", "role": "default" }} , 
 	{ "name": "Out_r_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_keep_V", "role": "default" }} , 
 	{ "name": "Out_r_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_strb_V", "role": "default" }} , 
 	{ "name": "Out_r_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_user_V", "role": "default" }} , 
 	{ "name": "Out_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_last_V", "role": "default" }} , 
 	{ "name": "Out_r_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_id_V", "role": "default" }} , 
 	{ "name": "Out_r_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_dest_V", "role": "default" }} , 
 	{ "name": "counter_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "counter", "role": "dout" }} , 
 	{ "name": "counter_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "counter", "role": "num_data_valid" }} , 
 	{ "name": "counter_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "counter", "role": "fifo_cap" }} , 
 	{ "name": "counter_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "counter", "role": "empty_n" }} , 
 	{ "name": "counter_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "counter", "role": "read" }} , 
 	{ "name": "num_blocks_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "num_blocks", "role": "dout" }} , 
 	{ "name": "num_blocks_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "num_blocks", "role": "num_data_valid" }} , 
 	{ "name": "num_blocks_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "num_blocks", "role": "fifo_cap" }} , 
 	{ "name": "num_blocks_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "num_blocks", "role": "empty_n" }} , 
 	{ "name": "num_blocks_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "num_blocks", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "threshold",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "262", "EstimateLatencyMax" : "262",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "appear_V1", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_98", "Port" : "appear_V1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "Out_r_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "Out_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Out_r_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "Out_r_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "Out_r_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "Out_r_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "Out_r_V_id_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "Out_r_V_dest_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "counter", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "counter_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "num_blocks", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "num_blocks_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_98", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "threshold_Pipeline_VITIS_LOOP_58_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "259", "EstimateLatencyMax" : "259",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "appear_V1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "over_thresh_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_58_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_98.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	threshold {
		appear_V1 {Type I LastRead 0 FirstWrite -1}
		Out_r_V_data_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_keep_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_strb_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_user_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_last_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_id_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_dest_V {Type O LastRead -1 FirstWrite 2}
		counter {Type I LastRead 1 FirstWrite -1}
		num_blocks {Type I LastRead 1 FirstWrite -1}}
	threshold_Pipeline_VITIS_LOOP_58_1 {
		appear_V1 {Type I LastRead 0 FirstWrite -1}
		over_thresh_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "262", "Max" : "262"}
	, {"Name" : "Interval", "Min" : "262", "Max" : "262"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	appear_V1 { ap_memory {  { appear_V1_address0 mem_address 1 8 }  { appear_V1_ce0 mem_ce 1 1 }  { appear_V1_q0 mem_dout 0 3 } } }
	Out_r_V_data_V { axis {  { Out_r_TDATA out_data 1 8 }  { Out_r_TREADY out_acc 0 1 } } }
	Out_r_V_keep_V { axis {  { Out_r_TKEEP out_data 1 1 } } }
	Out_r_V_strb_V { axis {  { Out_r_TSTRB out_data 1 1 } } }
	Out_r_V_user_V { axis {  { Out_r_TUSER out_data 1 1 } } }
	Out_r_V_last_V { axis {  { Out_r_TLAST out_data 1 1 } } }
	Out_r_V_id_V { axis {  { Out_r_TID out_data 1 1 } } }
	Out_r_V_dest_V { axis {  { Out_r_TVALID out_vld 1 1 }  { Out_r_TDEST out_data 1 1 } } }
	counter { ap_fifo {  { counter_dout fifo_port_we 0 32 }  { counter_num_data_valid fifo_status_num_data_valid 0 3 }  { counter_fifo_cap fifo_update 0 3 }  { counter_empty_n fifo_status 0 1 }  { counter_read fifo_data 1 1 } } }
	num_blocks { ap_fifo {  { num_blocks_dout fifo_port_we 0 32 }  { num_blocks_num_data_valid fifo_status_num_data_valid 0 3 }  { num_blocks_fifo_cap fifo_update 0 3 }  { num_blocks_empty_n fifo_status 0 1 }  { num_blocks_read fifo_data 1 1 } } }
}
