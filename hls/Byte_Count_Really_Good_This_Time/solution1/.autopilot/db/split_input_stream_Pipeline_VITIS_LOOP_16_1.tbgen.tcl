set moduleName split_input_stream_Pipeline_VITIS_LOOP_16_1
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
set C_modelName {split_input_stream_Pipeline_VITIS_LOOP_16_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ tmp_1 int 9 regular  }
	{ split_buffer int 9 regular {fifo 1 volatile }  }
	{ tmp_last_V int 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tmp_1", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "split_buffer", "interface" : "fifo", "bitwidth" : 9, "direction" : "WRITEONLY"} , 
 	{ "Name" : "tmp_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ split_buffer_din sc_out sc_lv 9 signal 1 } 
	{ split_buffer_num_data_valid sc_in sc_lv 9 signal 1 } 
	{ split_buffer_fifo_cap sc_in sc_lv 9 signal 1 } 
	{ split_buffer_full_n sc_in sc_logic 1 signal 1 } 
	{ split_buffer_write sc_out sc_logic 1 signal 1 } 
	{ tmp_1 sc_in sc_lv 9 signal 0 } 
	{ tmp_last_V sc_in sc_lv 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "split_buffer_din", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "split_buffer", "role": "din" }} , 
 	{ "name": "split_buffer_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "split_buffer", "role": "num_data_valid" }} , 
 	{ "name": "split_buffer_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "split_buffer", "role": "fifo_cap" }} , 
 	{ "name": "split_buffer_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_buffer", "role": "full_n" }} , 
 	{ "name": "split_buffer_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_buffer", "role": "write" }} , 
 	{ "name": "tmp_1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "tmp_1", "role": "default" }} , 
 	{ "name": "tmp_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tmp_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	tmp_1 { ap_none {  { tmp_1 in_data 0 9 } } }
	split_buffer { ap_fifo {  { split_buffer_din fifo_port_we 1 9 }  { split_buffer_num_data_valid fifo_status_num_data_valid 0 9 }  { split_buffer_fifo_cap fifo_update 0 9 }  { split_buffer_full_n fifo_status 0 1 }  { split_buffer_write fifo_data 1 1 } } }
	tmp_last_V { ap_none {  { tmp_last_V in_data 0 1 } } }
}
