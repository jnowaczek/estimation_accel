set moduleName make_go_fast
set isTopModule 1
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
set C_modelName {make_go_fast}
set C_modelType { void 0 }
set C_modelArgList {
	{ InStream_V_data_V int 8 regular {axi_s 0 volatile  { InStream Data } }  }
	{ InStream_V_keep_V int 1 regular {axi_s 0 volatile  { InStream Keep } }  }
	{ InStream_V_strb_V int 1 regular {axi_s 0 volatile  { InStream Strb } }  }
	{ InStream_V_last_V int 1 regular {axi_s 0 volatile  { InStream Last } }  }
	{ OutStream_V_data_V int 8 regular {axi_s 1 volatile  { OutStream Data } }  }
	{ OutStream_V_keep_V int 1 regular {axi_s 1 volatile  { OutStream Keep } }  }
	{ OutStream_V_strb_V int 1 regular {axi_s 1 volatile  { OutStream Strb } }  }
	{ OutStream_V_last_V int 1 regular {axi_s 1 volatile  { OutStream Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "InStream_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "InStream_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "InStream_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "InStream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "OutStream_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OutStream_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OutStream_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OutStream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ InStream_TDATA sc_in sc_lv 8 signal 0 } 
	{ InStream_TKEEP sc_in sc_lv 1 signal 1 } 
	{ InStream_TSTRB sc_in sc_lv 1 signal 2 } 
	{ InStream_TLAST sc_in sc_lv 1 signal 3 } 
	{ OutStream_TDATA sc_out sc_lv 8 signal 4 } 
	{ OutStream_TKEEP sc_out sc_lv 1 signal 5 } 
	{ OutStream_TSTRB sc_out sc_lv 1 signal 6 } 
	{ OutStream_TLAST sc_out sc_lv 1 signal 7 } 
	{ InStream_TVALID sc_in sc_logic 1 invld 3 } 
	{ InStream_TREADY sc_out sc_logic 1 inacc 3 } 
	{ OutStream_TVALID sc_out sc_logic 1 outvld 7 } 
	{ OutStream_TREADY sc_in sc_logic 1 outacc 7 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"make_go_fast","role":"start","value":"0","valid_bit":"0"},{"name":"make_go_fast","role":"continue","value":"0","valid_bit":"4"},{"name":"make_go_fast","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"make_go_fast","role":"start","value":"0","valid_bit":"0"},{"name":"make_go_fast","role":"done","value":"0","valid_bit":"1"},{"name":"make_go_fast","role":"idle","value":"0","valid_bit":"2"},{"name":"make_go_fast","role":"ready","value":"0","valid_bit":"3"},{"name":"make_go_fast","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "InStream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "InStream_V_data_V", "role": "default" }} , 
 	{ "name": "InStream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "InStream_V_keep_V", "role": "default" }} , 
 	{ "name": "InStream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "InStream_V_strb_V", "role": "default" }} , 
 	{ "name": "InStream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "InStream_V_last_V", "role": "default" }} , 
 	{ "name": "OutStream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutStream_V_data_V", "role": "default" }} , 
 	{ "name": "OutStream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OutStream_V_keep_V", "role": "default" }} , 
 	{ "name": "OutStream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OutStream_V_strb_V", "role": "default" }} , 
 	{ "name": "OutStream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OutStream_V_last_V", "role": "default" }} , 
 	{ "name": "InStream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "InStream_V_last_V", "role": "default" }} , 
 	{ "name": "InStream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "InStream_V_last_V", "role": "default" }} , 
 	{ "name": "OutStream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OutStream_V_last_V", "role": "default" }} , 
 	{ "name": "OutStream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "OutStream_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "9", "14", "15"],
		"CDFG" : "make_go_fast",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
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
			{"ID" : "2", "Name" : "split_input_stream_U0"}],
		"OutputProcess" : [
			{"ID" : "9", "Name" : "process_split_stream_U0"}],
		"Port" : [
			{"Name" : "InStream_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "split_input_stream_U0", "Port" : "InStream_V_data_V"}]},
			{"Name" : "InStream_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "split_input_stream_U0", "Port" : "InStream_V_keep_V"}]},
			{"Name" : "InStream_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "split_input_stream_U0", "Port" : "InStream_V_strb_V"}]},
			{"Name" : "InStream_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "split_input_stream_U0", "Port" : "InStream_V_last_V"}]},
			{"Name" : "OutStream_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "process_split_stream_U0", "Port" : "OutStream_V_data_V"}]},
			{"Name" : "OutStream_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "process_split_stream_U0", "Port" : "OutStream_V_keep_V"}]},
			{"Name" : "OutStream_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "process_split_stream_U0", "Port" : "OutStream_V_strb_V"}]},
			{"Name" : "OutStream_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "process_split_stream_U0", "Port" : "OutStream_V_last_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.split_input_stream_U0", "Parent" : "0", "Child" : ["3", "5", "6", "7", "8"],
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
			{"Name" : "split_buffer", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["9"], "DependentChan" : "14", "DependentChanDepth" : "256", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_split_input_stream_Pipeline_VITIS_LOOP_16_1_fu_46", "Port" : "split_buffer", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.split_input_stream_U0.grp_split_input_stream_Pipeline_VITIS_LOOP_16_1_fu_46", "Parent" : "2", "Child" : ["4"],
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
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.split_input_stream_U0.grp_split_input_stream_Pipeline_VITIS_LOOP_16_1_fu_46.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.split_input_stream_U0.regslice_both_InStream_V_data_V_U", "Parent" : "2"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.split_input_stream_U0.regslice_both_InStream_V_keep_V_U", "Parent" : "2"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.split_input_stream_U0.regslice_both_InStream_V_strb_V_U", "Parent" : "2"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.split_input_stream_U0.regslice_both_InStream_V_last_V_U", "Parent" : "2"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.process_split_stream_U0", "Parent" : "0", "Child" : ["10", "11", "12", "13"],
		"CDFG" : "process_split_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"StartSource" : "2",
		"StartFifo" : "start_for_process_split_stream_U0_U",
		"Port" : [
			{"Name" : "split_buffer", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "14", "DependentChanDepth" : "256", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "split_buffer_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "OutStream_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "OutStream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "OutStream_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OutStream_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OutStream_V_last_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.process_split_stream_U0.regslice_both_OutStream_V_data_V_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.process_split_stream_U0.regslice_both_OutStream_V_keep_V_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.process_split_stream_U0.regslice_both_OutStream_V_strb_V_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.process_split_stream_U0.regslice_both_OutStream_V_last_V_U", "Parent" : "9"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.split_buffer_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_process_split_stream_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	make_go_fast {
		InStream_V_data_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_last_V {Type I LastRead 0 FirstWrite -1}
		OutStream_V_data_V {Type O LastRead -1 FirstWrite 0}
		OutStream_V_keep_V {Type O LastRead -1 FirstWrite 0}
		OutStream_V_strb_V {Type O LastRead -1 FirstWrite 0}
		OutStream_V_last_V {Type O LastRead -1 FirstWrite 0}}
	split_input_stream {
		InStream_V_data_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		InStream_V_last_V {Type I LastRead 0 FirstWrite -1}
		split_buffer {Type O LastRead -1 FirstWrite 0}}
	split_input_stream_Pipeline_VITIS_LOOP_16_1 {
		tmp_1 {Type I LastRead 0 FirstWrite -1}
		split_buffer {Type O LastRead -1 FirstWrite 0}
		tmp_last_V {Type I LastRead 0 FirstWrite -1}}
	process_split_stream {
		split_buffer {Type I LastRead 0 FirstWrite -1}
		OutStream_V_data_V {Type O LastRead -1 FirstWrite 0}
		OutStream_V_keep_V {Type O LastRead -1 FirstWrite 0}
		OutStream_V_strb_V {Type O LastRead -1 FirstWrite 0}
		OutStream_V_last_V {Type O LastRead -1 FirstWrite 0}}}

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
	InStream_V_last_V { axis {  { InStream_TLAST in_data 0 1 }  { InStream_TVALID in_vld 0 1 }  { InStream_TREADY in_acc 1 1 } } }
	OutStream_V_data_V { axis {  { OutStream_TDATA out_data 1 8 } } }
	OutStream_V_keep_V { axis {  { OutStream_TKEEP out_data 1 1 } } }
	OutStream_V_strb_V { axis {  { OutStream_TSTRB out_data 1 1 } } }
	OutStream_V_last_V { axis {  { OutStream_TLAST out_data 1 1 }  { OutStream_TVALID out_vld 1 1 }  { OutStream_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
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
