set moduleName accelerator
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {accelerator}
set C_modelType { void 0 }
set C_modelArgList {
	{ In_r int 8 regular {fifo 0 volatile }  }
	{ num_blocks int 32 regular  }
	{ Out_r int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "In_r", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "num_blocks", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Out_r", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ In_r_dout sc_in sc_lv 8 signal 0 } 
	{ In_r_empty_n sc_in sc_logic 1 signal 0 } 
	{ In_r_read sc_out sc_logic 1 signal 0 } 
	{ num_blocks sc_in sc_lv 32 signal 1 } 
	{ Out_r_din sc_out sc_lv 32 signal 2 } 
	{ Out_r_full_n sc_in sc_logic 1 signal 2 } 
	{ Out_r_write sc_out sc_logic 1 signal 2 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "In_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "In_r", "role": "dout" }} , 
 	{ "name": "In_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "In_r", "role": "empty_n" }} , 
 	{ "name": "In_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "In_r", "role": "read" }} , 
 	{ "name": "num_blocks", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "num_blocks", "role": "default" }} , 
 	{ "name": "Out_r_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Out_r", "role": "din" }} , 
 	{ "name": "Out_r_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r", "role": "full_n" }} , 
 	{ "name": "Out_r_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r", "role": "write" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "9"],
		"CDFG" : "accelerator",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "dataflow_in_loop_VITIS_LOOP_10_1_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "dataflow_in_loop_VITIS_LOOP_10_1_U0"}],
		"Port" : [
			{"Name" : "In_r", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_10_1_U0", "Port" : "In_r"}]},
			{"Name" : "num_blocks", "Type" : "None", "Direction" : "I"},
			{"Name" : "Out_r", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_VITIS_LOOP_10_1_U0", "Port" : "Out_r"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_10_1", "PipelineType" : "dataflow",
				"LoopDec" : {"InfiniteLoop" : "0", "BodyInst" : "dataflow_in_loop_VITIS_LOOP_10_1_U0", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_10_1_U0", "Parent" : "0", "Child" : ["2", "3", "6"],
		"CDFG" : "dataflow_in_loop_VITIS_LOOP_10_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1158", "EstimateLatencyMax" : "1158",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "3", "Name" : "count_U0"}],
		"OutputProcess" : [
			{"ID" : "6", "Name" : "threshold_U0"}],
		"Port" : [
			{"Name" : "In_r", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "count_U0", "Port" : "In_r"}]},
			{"Name" : "Out_r", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "threshold_U0", "Port" : "Out_r"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_10_1_U0.appear_V_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0", "Parent" : "1", "Child" : ["4"],
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
					{"ID" : "4", "SubInstance" : "grp_count_Pipeline_APPEARANCES_fu_2861", "Port" : "In_r", "Inst_start_state" : "129", "Inst_end_state" : "130"}]},
			{"Name" : "appear", "Type" : "Memory", "Direction" : "IO", "DependentProc" : ["6"], "DependentChan" : "2", "PIPODir" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_count_Pipeline_APPEARANCES_fu_2861", "Port" : "appear", "Inst_start_state" : "129", "Inst_end_state" : "130"}]}]},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861", "Parent" : "3", "Child" : ["5"],
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
	{"ID" : "5", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_10_1_U0.count_U0.grp_count_Pipeline_APPEARANCES_fu_2861.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0", "Parent" : "1", "Child" : ["7"],
		"CDFG" : "threshold",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "260", "EstimateLatencyMax" : "260",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "appear", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "2",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31", "Port" : "appear", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "Out_r", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "Out_r_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31", "Parent" : "6", "Child" : ["8"],
		"CDFG" : "threshold_Pipeline_VITIS_LOOP_58_1",
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
			{"Name" : "appear", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "over_thresh_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_58_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_VITIS_LOOP_10_1_U0.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_31.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ap_bound_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	accelerator {
		In_r {Type I LastRead 1 FirstWrite -1}
		num_blocks {Type I LastRead 0 FirstWrite -1}
		Out_r {Type O LastRead -1 FirstWrite 2}}
	dataflow_in_loop_VITIS_LOOP_10_1 {
		In_r {Type I LastRead 1 FirstWrite -1}
		Out_r {Type O LastRead -1 FirstWrite 2}}
	count {
		In_r {Type I LastRead 1 FirstWrite -1}
		appear {Type IO LastRead 2 FirstWrite 0}}
	count_Pipeline_APPEARANCES {
		In_r {Type I LastRead 1 FirstWrite -1}
		appear {Type IO LastRead 2 FirstWrite 2}
		prev_out {Type O LastRead -1 FirstWrite 2}
		count_V_5_out {Type O LastRead -1 FirstWrite 2}}
	threshold {
		appear {Type I LastRead 0 FirstWrite -1}
		Out_r {Type O LastRead -1 FirstWrite 2}}
	threshold_Pipeline_VITIS_LOOP_58_1 {
		appear {Type I LastRead 0 FirstWrite -1}
		over_thresh_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	In_r { ap_fifo {  { In_r_dout fifo_port_we 0 8 }  { In_r_empty_n fifo_status 0 1 }  { In_r_read fifo_data 1 1 } } }
	num_blocks { ap_none {  { num_blocks in_data 0 32 } } }
	Out_r { ap_fifo {  { Out_r_din fifo_port_we 1 32 }  { Out_r_full_n fifo_status 0 1 }  { Out_r_write fifo_data 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	In_r { fifo_read 1 no_conditional }
	Out_r { fifo_write 1 no_conditional }
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
