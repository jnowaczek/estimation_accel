set moduleName dataflow_in_loop_VITIS_LOOP_10_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {dataflow_in_loop_VITIS_LOOP_10_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ In_r int 8 regular {axi_s 0 volatile  { In_r Data } }  }
	{ Out_r_V_data_V int 8 regular {axi_s 1 volatile  { Out_r Data } }  }
	{ Out_r_V_keep_V int 1 regular {axi_s 1 volatile  { Out_r Keep } }  }
	{ Out_r_V_strb_V int 1 regular {axi_s 1 volatile  { Out_r Strb } }  }
	{ Out_r_V_last_V int 1 regular {axi_s 1 volatile  { Out_r Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "In_r", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "Out_r_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Out_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ In_r_TDATA sc_in sc_lv 8 signal 0 } 
	{ Out_r_TDATA sc_out sc_lv 8 signal 1 } 
	{ Out_r_TKEEP sc_out sc_lv 1 signal 2 } 
	{ Out_r_TSTRB sc_out sc_lv 1 signal 3 } 
	{ Out_r_TLAST sc_out sc_lv 1 signal 4 } 
	{ In_r_TVALID sc_in sc_logic 1 invld 0 } 
	{ In_r_TREADY sc_out sc_logic 1 inacc 0 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ Out_r_TVALID sc_out sc_logic 1 outvld 4 } 
	{ Out_r_TREADY sc_in sc_logic 1 outacc 4 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "In_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "In_r", "role": "TDATA" }} , 
 	{ "name": "Out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "Out_r_V_data_V", "role": "default" }} , 
 	{ "name": "Out_r_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_keep_V", "role": "default" }} , 
 	{ "name": "Out_r_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_strb_V", "role": "default" }} , 
 	{ "name": "Out_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Out_r_V_last_V", "role": "default" }} , 
 	{ "name": "In_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "In_r", "role": "TVALID" }} , 
 	{ "name": "In_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "In_r", "role": "TREADY" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "Out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Out_r_V_last_V", "role": "default" }} , 
 	{ "name": "Out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "Out_r_V_last_V", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "5"],
		"CDFG" : "dataflow_in_loop_VITIS_LOOP_10_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1157", "EstimateLatencyMax" : "1157",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "2", "Name" : "count_U0"}],
		"OutputProcess" : [
			{"ID" : "5", "Name" : "threshold_U0"}],
		"Port" : [
			{"Name" : "In_r", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "count_U0", "Port" : "In_r"}]},
			{"Name" : "Out_r_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "threshold_U0", "Port" : "Out_r_V_data_V"}]},
			{"Name" : "Out_r_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "threshold_U0", "Port" : "Out_r_V_keep_V"}]},
			{"Name" : "Out_r_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "threshold_U0", "Port" : "Out_r_V_strb_V"}]},
			{"Name" : "Out_r_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "threshold_U0", "Port" : "Out_r_V_last_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.appear_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.count_U0", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "count",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1157", "EstimateLatencyMax" : "1157",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "In_r", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_count_Pipeline_APPEARANCES_fu_2863", "Port" : "In_r", "Inst_start_state" : "129", "Inst_end_state" : "130"}]},
			{"Name" : "appear", "Type" : "Memory", "Direction" : "IO", "DependentProc" : ["5"], "DependentChan" : "1", "PIPODir" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_count_Pipeline_APPEARANCES_fu_2863", "Port" : "appear", "Inst_start_state" : "129", "Inst_end_state" : "130"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.count_U0.grp_count_Pipeline_APPEARANCES_fu_2863", "Parent" : "2", "Child" : ["4"],
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
			{"FromInitialState" : "ap_enable_state2_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_30", "FromInitialSV" : "1", "FromFinalState" : "ap_enable_state2_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_30", "FromFinalSV" : "1", "FromAddress" : "appear_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state2_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_33", "ToInitialSV" : "1", "ToFinalState" : "ap_enable_state3_pp0_iter2_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter2", "ToFinalOperation" : "ap_enable_operation_43", "ToFinalSV" : "2", "ToAddress" : "appear_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "8", "II" : "1", "Pragma" : "(byte_count_stream/src/byte_count_stream.cpp:22:9)", "Type" : "RAW"}],
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
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.count_U0.grp_count_Pipeline_APPEARANCES_fu_2863.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.threshold_U0", "Parent" : "0", "Child" : ["6"],
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
			{"Name" : "appear", "Type" : "Memory", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "1",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55", "Port" : "appear", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "Out_r_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "Out_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Out_r_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "Out_r_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "Out_r_V_last_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55", "Parent" : "5", "Child" : ["7"],
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
			{"Name" : "appear", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "over_thresh_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_58_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.threshold_U0.grp_threshold_Pipeline_VITIS_LOOP_58_1_fu_55.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"}]}


set ArgLastReadFirstWriteLatency {
	dataflow_in_loop_VITIS_LOOP_10_1 {
		In_r {Type I LastRead 0 FirstWrite -1}
		Out_r_V_data_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_keep_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_strb_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_last_V {Type O LastRead -1 FirstWrite 2}}
	count {
		In_r {Type I LastRead 0 FirstWrite -1}
		appear {Type IO LastRead 1 FirstWrite 0}}
	count_Pipeline_APPEARANCES {
		In_r {Type I LastRead 0 FirstWrite -1}
		appear {Type IO LastRead 1 FirstWrite 1}
		prev_out {Type O LastRead -1 FirstWrite 1}
		count_V_5_out {Type O LastRead -1 FirstWrite 1}}
	threshold {
		appear {Type I LastRead 0 FirstWrite -1}
		Out_r_V_data_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_keep_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_strb_V {Type O LastRead -1 FirstWrite 2}
		Out_r_V_last_V {Type O LastRead -1 FirstWrite 2}}
	threshold_Pipeline_VITIS_LOOP_58_1 {
		appear {Type I LastRead 0 FirstWrite -1}
		over_thresh_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1157", "Max" : "1157"}
	, {"Name" : "Interval", "Min" : "1158", "Max" : "1158"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	In_r { axis {  { In_r_TDATA in_data 0 8 }  { In_r_TVALID in_vld 0 1 }  { In_r_TREADY in_acc 1 1 } } }
	Out_r_V_data_V { axis {  { Out_r_TDATA out_data 1 8 } } }
	Out_r_V_keep_V { axis {  { Out_r_TKEEP out_data 1 1 } } }
	Out_r_V_strb_V { axis {  { Out_r_TSTRB out_data 1 1 } } }
	Out_r_V_last_V { axis {  { Out_r_TLAST out_data 1 1 }  { Out_r_TVALID out_vld 1 1 }  { Out_r_TREADY out_acc 0 1 } } }
}