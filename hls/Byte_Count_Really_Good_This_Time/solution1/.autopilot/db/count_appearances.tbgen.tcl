set moduleName count_appearances
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
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {count_appearances}
set C_modelType { void 0 }
set C_modelArgList {
	{ bytes int 8 regular {fifo 0 volatile }  }
	{ appearances int 16 regular {array 256 { 2 3 } 1 1 }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "bytes", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "appearances", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ bytes_dout sc_in sc_lv 8 signal 0 } 
	{ bytes_num_data_valid sc_in sc_lv 2 signal 0 } 
	{ bytes_fifo_cap sc_in sc_lv 2 signal 0 } 
	{ bytes_empty_n sc_in sc_logic 1 signal 0 } 
	{ bytes_read sc_out sc_logic 1 signal 0 } 
	{ appearances_address0 sc_out sc_lv 8 signal 1 } 
	{ appearances_ce0 sc_out sc_logic 1 signal 1 } 
	{ appearances_we0 sc_out sc_logic 1 signal 1 } 
	{ appearances_d0 sc_out sc_lv 16 signal 1 } 
	{ appearances_q0 sc_in sc_lv 16 signal 1 } 
	{ appearances_full_n sc_in sc_logic 1 signal -1 } 
	{ appearances_write sc_out sc_logic 1 signal -1 } 
	{ appearances_empty_n sc_in sc_logic 1 signal -1 } 
	{ appearances_read sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "bytes_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bytes", "role": "dout" }} , 
 	{ "name": "bytes_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "bytes", "role": "num_data_valid" }} , 
 	{ "name": "bytes_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "bytes", "role": "fifo_cap" }} , 
 	{ "name": "bytes_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytes", "role": "empty_n" }} , 
 	{ "name": "bytes_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytes", "role": "read" }} , 
 	{ "name": "appearances_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "appearances", "role": "address0" }} , 
 	{ "name": "appearances_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appearances", "role": "ce0" }} , 
 	{ "name": "appearances_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appearances", "role": "we0" }} , 
 	{ "name": "appearances_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "appearances", "role": "d0" }} , 
 	{ "name": "appearances_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "appearances", "role": "q0" }} , 
 	{ "name": "appearances_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appearances_full_n", "role": "default" }} , 
 	{ "name": "appearances_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appearances_write", "role": "default" }} , 
 	{ "name": "appearances_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appearances_empty_n", "role": "default" }} , 
 	{ "name": "appearances_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appearances_read", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3"],
		"CDFG" : "count_appearances",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5387", "EstimateLatencyMax" : "5387",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bytes", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_count_appearances_Pipeline_VITIS_LOOP_36_2_fu_77", "Port" : "bytes", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "appearances", "Type" : "MemFifo", "Direction" : "IO", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "3",
				"BlockSignal" : [
					{"Name" : "appearances_o_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_count_appearances_Pipeline_VITIS_LOOP_36_2_fu_77", "Port" : "appearances", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1", "SubInstance" : "grp_count_appearances_Pipeline_VITIS_LOOP_31_1_fu_71", "Port" : "appearances", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_count_appearances_Pipeline_VITIS_LOOP_31_1_fu_71", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "count_appearances_Pipeline_VITIS_LOOP_31_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "appearances", "Type" : "MemFifo", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_31_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_count_appearances_Pipeline_VITIS_LOOP_31_1_fu_71.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_count_appearances_Pipeline_VITIS_LOOP_36_2_fu_77", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "count_appearances_Pipeline_VITIS_LOOP_36_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5125", "EstimateLatencyMax" : "5125",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bytes", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "bytes_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "appearances", "Type" : "MemFifo", "Direction" : "IO"},
			{"Name" : "count_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "prev_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_36_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_count_appearances_Pipeline_VITIS_LOOP_36_2_fu_77.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"}]}


set ArgLastReadFirstWriteLatency {
	count_appearances {
		bytes {Type I LastRead 1 FirstWrite -1}
		appearances {Type IO LastRead 4 FirstWrite 1}}
	count_appearances_Pipeline_VITIS_LOOP_31_1 {
		appearances {Type O LastRead -1 FirstWrite 1}}
	count_appearances_Pipeline_VITIS_LOOP_36_2 {
		bytes {Type I LastRead 1 FirstWrite -1}
		appearances {Type IO LastRead 4 FirstWrite 3}
		count_out {Type O LastRead -1 FirstWrite 3}
		prev_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5387", "Max" : "5387"}
	, {"Name" : "Interval", "Min" : "5387", "Max" : "5387"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	bytes { ap_fifo {  { bytes_dout fifo_port_we 0 8 }  { bytes_num_data_valid fifo_status_num_data_valid 0 2 }  { bytes_fifo_cap fifo_update 0 2 }  { bytes_empty_n fifo_status 0 1 }  { bytes_read fifo_data 1 1 } } }
	appearances { mem_fifo {  { appearances_address0 mem_address 1 8 }  { appearances_ce0 mem_ce 1 1 }  { appearances_we0 mem_we 1 1 }  { appearances_d0 mem_din 1 16 }  { appearances_q0 mem_dout 0 16 } } }
}
