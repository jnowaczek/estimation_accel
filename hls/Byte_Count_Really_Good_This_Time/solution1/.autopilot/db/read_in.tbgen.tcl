set moduleName read_in
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
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {read_in}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_r_V_data_V int 8 regular {axi_s 0 volatile  { in_r Data } }  }
	{ in_r_V_keep_V int 1 regular {axi_s 0 volatile  { in_r Keep } }  }
	{ in_r_V_strb_V int 1 regular {axi_s 0 volatile  { in_r Strb } }  }
	{ in_r_V_last_V int 1 regular {axi_s 0 volatile  { in_r Last } }  }
	{ n int 32 regular  }
	{ split_in int 8 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "in_r_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "in_r_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_r_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "n", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "split_in", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ in_r_TVALID sc_in sc_logic 1 invld 3 } 
	{ split_in_din sc_out sc_lv 8 signal 5 } 
	{ split_in_full_n sc_in sc_logic 1 signal 5 } 
	{ split_in_write sc_out sc_logic 1 signal 5 } 
	{ in_r_TDATA sc_in sc_lv 8 signal 0 } 
	{ in_r_TREADY sc_out sc_logic 1 inacc 3 } 
	{ in_r_TKEEP sc_in sc_lv 1 signal 1 } 
	{ in_r_TSTRB sc_in sc_lv 1 signal 2 } 
	{ in_r_TLAST sc_in sc_lv 1 signal 3 } 
	{ n sc_in sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "in_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_r_V_last_V", "role": "default" }} , 
 	{ "name": "split_in_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_in", "role": "din" }} , 
 	{ "name": "split_in_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_in", "role": "full_n" }} , 
 	{ "name": "split_in_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_in", "role": "write" }} , 
 	{ "name": "in_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_r_V_data_V", "role": "default" }} , 
 	{ "name": "in_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_r_V_last_V", "role": "default" }} , 
 	{ "name": "in_r_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r_V_keep_V", "role": "default" }} , 
 	{ "name": "in_r_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r_V_strb_V", "role": "default" }} , 
 	{ "name": "in_r_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r_V_last_V", "role": "default" }} , 
 	{ "name": "n", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "read_in",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
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
			{"Name" : "in_r_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_r",
				"BlockSignal" : [
					{"Name" : "in_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_r_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_r"},
			{"Name" : "in_r_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_r"},
			{"Name" : "in_r_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_r"},
			{"Name" : "n", "Type" : "None", "Direction" : "I"},
			{"Name" : "split_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_in_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_4_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_r_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_r_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_r_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_r_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_in {
		in_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		split_in {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 1

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	in_r_V_data_V { axis {  { in_r_TDATA in_data 0 8 } } }
	in_r_V_keep_V { axis {  { in_r_TKEEP in_data 0 1 } } }
	in_r_V_strb_V { axis {  { in_r_TSTRB in_data 0 1 } } }
	in_r_V_last_V { axis {  { in_r_TVALID in_vld 0 1 }  { in_r_TREADY in_acc 1 1 }  { in_r_TLAST in_data 0 1 } } }
	n { ap_none {  { n in_data 0 32 } } }
	split_in { ap_fifo {  { split_in_din fifo_port_we 1 8 }  { split_in_full_n fifo_status 0 1 }  { split_in_write fifo_data 1 1 } } }
}
