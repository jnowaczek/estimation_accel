set moduleName count
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
set C_modelName {count}
set C_modelType { void 0 }
set C_modelArgList {
	{ In_r int 8 regular {fifo 0 volatile }  }
	{ appear int 3 regular {array 256 { 0 2 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "In_r", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "appear", "interface" : "memory", "bitwidth" : 3, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ In_r_dout sc_in sc_lv 8 signal 0 } 
	{ In_r_empty_n sc_in sc_logic 1 signal 0 } 
	{ In_r_read sc_out sc_logic 1 signal 0 } 
	{ appear_address0 sc_out sc_lv 8 signal 1 } 
	{ appear_ce0 sc_out sc_logic 1 signal 1 } 
	{ appear_we0 sc_out sc_logic 1 signal 1 } 
	{ appear_d0 sc_out sc_lv 3 signal 1 } 
	{ appear_address1 sc_out sc_lv 8 signal 1 } 
	{ appear_ce1 sc_out sc_logic 1 signal 1 } 
	{ appear_we1 sc_out sc_logic 1 signal 1 } 
	{ appear_d1 sc_out sc_lv 3 signal 1 } 
	{ appear_q1 sc_in sc_lv 3 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "In_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "In_r", "role": "dout" }} , 
 	{ "name": "In_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "In_r", "role": "empty_n" }} , 
 	{ "name": "In_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "In_r", "role": "read" }} , 
 	{ "name": "appear_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "appear", "role": "address0" }} , 
 	{ "name": "appear_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appear", "role": "ce0" }} , 
 	{ "name": "appear_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appear", "role": "we0" }} , 
 	{ "name": "appear_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "appear", "role": "d0" }} , 
 	{ "name": "appear_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "appear", "role": "address1" }} , 
 	{ "name": "appear_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appear", "role": "ce1" }} , 
 	{ "name": "appear_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appear", "role": "we1" }} , 
 	{ "name": "appear_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "appear", "role": "d1" }} , 
 	{ "name": "appear_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "appear", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "count",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1158", "EstimateLatencyMax" : "1158",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "In_r", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_count_Pipeline_APPEARANCES_fu_2861", "Port" : "In_r", "Inst_start_state" : "129", "Inst_end_state" : "130"}]},
			{"Name" : "appear", "Type" : "Memory", "Direction" : "IO", "DependentProc" : ["0"], "DependentChan" : "0", "PIPODir" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_count_Pipeline_APPEARANCES_fu_2861", "Port" : "appear", "Inst_start_state" : "129", "Inst_end_state" : "130"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_count_Pipeline_APPEARANCES_fu_2861", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "count_Pipeline_APPEARANCES",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1028", "EstimateLatencyMax" : "1028",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"DependenceCheck" : [
			{"FromInitialState" : "ap_enable_state3_pp0_iter2_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter2", "FromInitialOperation" : "ap_enable_operation_31", "FromInitialSV" : "2", "FromFinalState" : "ap_enable_state3_pp0_iter2_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter2", "FromFinalOperation" : "ap_enable_operation_31", "FromFinalSV" : "2", "FromAddress" : "appear_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state3_pp0_iter2_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter2", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter3", "ToInitialOperation" : "ap_enable_operation_34", "ToInitialSV" : "2", "ToFinalState" : "ap_enable_state4_pp0_iter3_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter3", "ToFinalOperation" : "ap_enable_operation_44", "ToFinalSV" : "3", "ToAddress" : "appear_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(byte_count_stream/src/byte_count_stream.cpp:22:9)", "Type" : "RAW"}],
		"Port" : [
			{"Name" : "In_r", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "In_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "appear", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "prev_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "count_V_5_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "APPEARANCES", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_count_Pipeline_APPEARANCES_fu_2861.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	count {
		In_r {Type I LastRead 1 FirstWrite -1}
		appear {Type IO LastRead 2 FirstWrite 0}}
	count_Pipeline_APPEARANCES {
		In_r {Type I LastRead 1 FirstWrite -1}
		appear {Type IO LastRead 2 FirstWrite 2}
		prev_out {Type O LastRead -1 FirstWrite 2}
		count_V_5_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1158", "Max" : "1158"}
	, {"Name" : "Interval", "Min" : "1158", "Max" : "1158"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	In_r { ap_fifo {  { In_r_dout fifo_port_we 0 8 }  { In_r_empty_n fifo_status 0 1 }  { In_r_read fifo_data 1 1 } } }
	appear { ap_memory {  { appear_address0 mem_address 1 8 }  { appear_ce0 mem_ce 1 1 }  { appear_we0 mem_we 1 1 }  { appear_d0 mem_din 1 3 }  { appear_address1 MemPortADDR2 1 8 }  { appear_ce1 MemPortCE2 1 1 }  { appear_we1 MemPortWE2 1 1 }  { appear_d1 MemPortDIN2 1 3 }  { appear_q1 MemPortDOUT2 0 3 } } }
}
