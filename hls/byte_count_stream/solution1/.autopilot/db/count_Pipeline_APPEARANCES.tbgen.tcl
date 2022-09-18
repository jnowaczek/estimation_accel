set moduleName count_Pipeline_APPEARANCES
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {count_Pipeline_APPEARANCES}
set C_modelType { void 0 }
set C_modelArgList {
	{ In_r int 8 regular {axi_s 0 volatile  { In_r Data } }  }
	{ appear int 3 regular {array 256 { 0 1 } 1 1 }  }
	{ prev_out int 8 regular {pointer 1}  }
	{ count_V_5_out int 3 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "In_r", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "appear", "interface" : "memory", "bitwidth" : 3, "direction" : "READWRITE"} , 
 	{ "Name" : "prev_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "count_V_5_out", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ In_r_TVALID sc_in sc_logic 1 invld 0 } 
	{ In_r_TDATA sc_in sc_lv 8 signal 0 } 
	{ In_r_TREADY sc_out sc_logic 1 inacc 0 } 
	{ appear_address0 sc_out sc_lv 8 signal 1 } 
	{ appear_ce0 sc_out sc_logic 1 signal 1 } 
	{ appear_we0 sc_out sc_logic 1 signal 1 } 
	{ appear_d0 sc_out sc_lv 3 signal 1 } 
	{ appear_address1 sc_out sc_lv 8 signal 1 } 
	{ appear_ce1 sc_out sc_logic 1 signal 1 } 
	{ appear_q1 sc_in sc_lv 3 signal 1 } 
	{ prev_out sc_out sc_lv 8 signal 2 } 
	{ prev_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ count_V_5_out sc_out sc_lv 3 signal 3 } 
	{ count_V_5_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "In_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "In_r", "role": "TVALID" }} , 
 	{ "name": "In_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "In_r", "role": "TDATA" }} , 
 	{ "name": "In_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "In_r", "role": "TREADY" }} , 
 	{ "name": "appear_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "appear", "role": "address0" }} , 
 	{ "name": "appear_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appear", "role": "ce0" }} , 
 	{ "name": "appear_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appear", "role": "we0" }} , 
 	{ "name": "appear_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "appear", "role": "d0" }} , 
 	{ "name": "appear_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "appear", "role": "address1" }} , 
 	{ "name": "appear_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "appear", "role": "ce1" }} , 
 	{ "name": "appear_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "appear", "role": "q1" }} , 
 	{ "name": "prev_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "prev_out", "role": "default" }} , 
 	{ "name": "prev_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "prev_out", "role": "ap_vld" }} , 
 	{ "name": "count_V_5_out", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "count_V_5_out", "role": "default" }} , 
 	{ "name": "count_V_5_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "count_V_5_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "count_Pipeline_APPEARANCES",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"DependenceCheck" : [
			{"FromInitialState" : "ap_enable_state2_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_30", "FromInitialSV" : "1", "FromFinalState" : "ap_enable_state2_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_30", "FromFinalSV" : "1", "FromAddress" : "appear_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state2_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_33", "ToInitialSV" : "1", "ToFinalState" : "ap_enable_state3_pp0_iter2_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter2", "ToFinalOperation" : "ap_enable_operation_43", "ToFinalSV" : "2", "ToAddress" : "appear_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(byte_count_stream/src/byte_count_stream.cpp:25:9)", "Type" : "RAW"}],
		"Port" : [
			{"Name" : "In_r", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "In_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "appear", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "prev_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "count_V_5_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "APPEARANCES", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	count_Pipeline_APPEARANCES {
		In_r {Type I LastRead 0 FirstWrite -1}
		appear {Type IO LastRead 1 FirstWrite 1}
		prev_out {Type O LastRead -1 FirstWrite 1}
		count_V_5_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1027", "Max" : "1027"}
	, {"Name" : "Interval", "Min" : "1027", "Max" : "1027"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	In_r { axis {  { In_r_TVALID in_vld 0 1 }  { In_r_TDATA in_data 0 8 }  { In_r_TREADY in_acc 1 1 } } }
	appear { ap_memory {  { appear_address0 mem_address 1 8 }  { appear_ce0 mem_ce 1 1 }  { appear_we0 mem_we 1 1 }  { appear_d0 mem_din 1 3 }  { appear_address1 MemPortADDR2 1 8 }  { appear_ce1 MemPortCE2 1 1 }  { appear_q1 in_data 0 3 } } }
	prev_out { ap_vld {  { prev_out out_data 1 8 }  { prev_out_ap_vld out_vld 1 1 } } }
	count_V_5_out { ap_vld {  { count_V_5_out out_data 1 3 }  { count_V_5_out_ap_vld out_vld 1 1 } } }
}
