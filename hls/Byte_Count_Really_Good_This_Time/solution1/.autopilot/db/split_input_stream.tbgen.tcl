set moduleName split_input_stream
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
set C_modelName {split_input_stream}
set C_modelType { void 0 }
set C_modelArgList {
	{ InStream_V_data_V int 8 regular {axi_s 0 volatile  { InStream Data } }  }
	{ InStream_V_keep_V int 1 regular {axi_s 0 volatile  { InStream Keep } }  }
	{ InStream_V_strb_V int 1 regular {axi_s 0 volatile  { InStream Strb } }  }
	{ InStream_V_last_V int 1 regular {axi_s 0 volatile  { InStream Last } }  }
	{ split_buffer int 9 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "InStream_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "InStream_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "InStream_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "InStream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "split_buffer", "interface" : "fifo", "bitwidth" : 9, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
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
	{ InStream_TDATA sc_in sc_lv 8 signal 0 } 
	{ InStream_TVALID sc_in sc_logic 1 invld 3 } 
	{ InStream_TREADY sc_out sc_logic 1 inacc 3 } 
	{ InStream_TKEEP sc_in sc_lv 1 signal 1 } 
	{ InStream_TSTRB sc_in sc_lv 1 signal 2 } 
	{ InStream_TLAST sc_in sc_lv 1 signal 3 } 
	{ split_buffer_din sc_out sc_lv 9 signal 4 } 
	{ split_buffer_num_data_valid sc_in sc_lv 9 signal 4 } 
	{ split_buffer_fifo_cap sc_in sc_lv 9 signal 4 } 
	{ split_buffer_full_n sc_in sc_logic 1 signal 4 } 
	{ split_buffer_write sc_out sc_logic 1 signal 4 } 
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
 	{ "name": "InStream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "InStream_V_data_V", "role": "default" }} , 
 	{ "name": "InStream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "InStream_V_last_V", "role": "default" }} , 
 	{ "name": "InStream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "InStream_V_last_V", "role": "default" }} , 
 	{ "name": "InStream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "InStream_V_keep_V", "role": "default" }} , 
 	{ "name": "InStream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "InStream_V_strb_V", "role": "default" }} , 
 	{ "name": "InStream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "InStream_V_last_V", "role": "default" }} , 
 	{ "name": "split_buffer_din", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "split_buffer", "role": "din" }} , 
 	{ "name": "split_buffer_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "split_buffer", "role": "num_data_valid" }} , 
 	{ "name": "split_buffer_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "split_buffer", "role": "fifo_cap" }} , 
 	{ "name": "split_buffer_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_buffer", "role": "full_n" }} , 
 	{ "name": "split_buffer_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_buffer", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "4", "5", "6"],
		"CDFG" : "split_input_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "InStream_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "InStream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "InStream_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "InStream_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "InStream_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "split_buffer", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "256", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_split_input_stream_Pipeline_VITIS_LOOP_16_1_fu_46", "Port" : "split_buffer", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_split_input_stream_Pipeline_VITIS_LOOP_16_1_fu_46", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "split_input_stream_Pipeline_VITIS_LOOP_16_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "tmp_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "split_buffer", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "split_buffer_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tmp_last_V", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_16_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_split_input_stream_Pipeline_VITIS_LOOP_16_1_fu_46.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_InStream_V_data_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_InStream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_InStream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_InStream_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	split_input_stream {
		InStream_V_data_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_last_V {Type I LastRead 0 FirstWrite -1}
		split_buffer {Type O LastRead -1 FirstWrite 0}}
	split_input_stream_Pipeline_VITIS_LOOP_16_1 {
		tmp_1 {Type I LastRead 0 FirstWrite -1}
		split_buffer {Type O LastRead -1 FirstWrite 0}
		tmp_last_V {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	InStream_V_data_V { axis {  { InStream_TDATA in_data 0 8 } } }
	InStream_V_keep_V { axis {  { InStream_TKEEP in_data 0 1 } } }
	InStream_V_strb_V { axis {  { InStream_TSTRB in_data 0 1 } } }
	InStream_V_last_V { axis {  { InStream_TVALID in_vld 0 1 }  { InStream_TREADY in_acc 1 1 }  { InStream_TLAST in_data 0 1 } } }
	split_buffer { ap_fifo {  { split_buffer_din fifo_port_we 1 9 }  { split_buffer_num_data_valid fifo_status_num_data_valid 0 9 }  { split_buffer_fifo_cap fifo_update 0 9 }  { split_buffer_full_n fifo_status 0 1 }  { split_buffer_write fifo_data 1 1 } } }
}
