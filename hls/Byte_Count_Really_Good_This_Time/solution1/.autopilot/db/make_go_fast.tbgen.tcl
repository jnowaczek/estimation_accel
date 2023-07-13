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
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {make_go_fast}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_r_V_data_V int 8 regular {axi_s 0 volatile  { in_r Data } }  }
	{ in_r_V_keep_V int 1 regular {axi_s 0 volatile  { in_r Keep } }  }
	{ in_r_V_strb_V int 1 regular {axi_s 0 volatile  { in_r Strb } }  }
	{ in_r_V_last_V int 1 regular {axi_s 0 volatile  { in_r Last } }  }
	{ n int 32 regular  }
	{ out_r_V_data_V int 8 regular {axi_s 1 volatile  { out_r Data } }  }
	{ out_r_V_keep_V int 1 regular {axi_s 1 volatile  { out_r Keep } }  }
	{ out_r_V_strb_V int 1 regular {axi_s 1 volatile  { out_r Strb } }  }
	{ out_r_V_last_V int 1 regular {axi_s 1 volatile  { out_r Last } }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "in_r_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "in_r_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_r_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "n", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_r_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_r_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_r_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_r_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ in_r_TDATA sc_in sc_lv 8 signal 0 } 
	{ in_r_TKEEP sc_in sc_lv 1 signal 1 } 
	{ in_r_TSTRB sc_in sc_lv 1 signal 2 } 
	{ in_r_TLAST sc_in sc_lv 1 signal 3 } 
	{ n sc_in sc_lv 32 signal 4 } 
	{ out_r_TDATA sc_out sc_lv 8 signal 5 } 
	{ out_r_TKEEP sc_out sc_lv 1 signal 6 } 
	{ out_r_TSTRB sc_out sc_lv 1 signal 7 } 
	{ out_r_TLAST sc_out sc_lv 1 signal 8 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ in_r_TVALID sc_in sc_logic 1 invld 3 } 
	{ in_r_TREADY sc_out sc_logic 1 inacc 3 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ out_r_TVALID sc_out sc_logic 1 outvld 8 } 
	{ out_r_TREADY sc_in sc_logic 1 outacc 8 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
}
set NewPortList {[ 
	{ "name": "in_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_r_V_data_V", "role": "default" }} , 
 	{ "name": "in_r_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r_V_keep_V", "role": "default" }} , 
 	{ "name": "in_r_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r_V_strb_V", "role": "default" }} , 
 	{ "name": "in_r_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r_V_last_V", "role": "default" }} , 
 	{ "name": "n", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "n", "role": "default" }} , 
 	{ "name": "out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_r_V_data_V", "role": "default" }} , 
 	{ "name": "out_r_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r_V_keep_V", "role": "default" }} , 
 	{ "name": "out_r_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r_V_strb_V", "role": "default" }} , 
 	{ "name": "out_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r_V_last_V", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "in_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_r_V_last_V", "role": "default" }} , 
 	{ "name": "in_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_r_V_last_V", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_r_V_last_V", "role": "default" }} , 
 	{ "name": "out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_r_V_last_V", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "7", "16", "22", "23"],
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
			{"ID" : "1", "Name" : "read_in_U0"},
			{"ID" : "16", "Name" : "write_out_U0"}],
		"OutputProcess" : [
			{"ID" : "16", "Name" : "write_out_U0"}],
		"Port" : [
			{"Name" : "in_r_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_r",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "read_in_U0", "Port" : "in_r_V_data_V"}]},
			{"Name" : "in_r_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_r",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "read_in_U0", "Port" : "in_r_V_keep_V"}]},
			{"Name" : "in_r_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_r",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "read_in_U0", "Port" : "in_r_V_strb_V"}]},
			{"Name" : "in_r_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_r",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "read_in_U0", "Port" : "in_r_V_last_V"}]},
			{"Name" : "n", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_r_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_r",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "write_out_U0", "Port" : "out_r_V_data_V"}]},
			{"Name" : "out_r_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_r",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "write_out_U0", "Port" : "out_r_V_keep_V"}]},
			{"Name" : "out_r_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_r",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "write_out_U0", "Port" : "out_r_V_strb_V"}]},
			{"Name" : "out_r_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_r",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "write_out_U0", "Port" : "out_r_V_last_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.read_in_U0", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6"],
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
			{"Name" : "split_in", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_in_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_4_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.read_in_U0.flow_control_loop_pipe_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.read_in_U0.regslice_both_in_r_V_data_V_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.read_in_U0.regslice_both_in_r_V_keep_V_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.read_in_U0.regslice_both_in_r_V_strb_V_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.read_in_U0.regslice_both_in_r_V_last_V_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.KPN_U0", "Parent" : "0", "Child" : ["8", "9", "10", "11", "12", "13", "14", "15"],
		"CDFG" : "KPN",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "8", "Name" : "worker_1_U0"},
			{"ID" : "9", "Name" : "worker_2_U0"},
			{"ID" : "10", "Name" : "worker_3_U0"},
			{"ID" : "11", "Name" : "worker_4_U0"},
			{"ID" : "12", "Name" : "worker_5_U0"},
			{"ID" : "13", "Name" : "worker_6_U0"},
			{"ID" : "14", "Name" : "worker_7_U0"},
			{"ID" : "15", "Name" : "worker_U0"}],
		"OutputProcess" : [
			{"ID" : "8", "Name" : "worker_1_U0"},
			{"ID" : "9", "Name" : "worker_2_U0"},
			{"ID" : "10", "Name" : "worker_3_U0"},
			{"ID" : "11", "Name" : "worker_4_U0"},
			{"ID" : "12", "Name" : "worker_5_U0"},
			{"ID" : "13", "Name" : "worker_6_U0"},
			{"ID" : "14", "Name" : "worker_7_U0"},
			{"ID" : "15", "Name" : "worker_U0"}],
		"Port" : [
			{"Name" : "split_out_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "worker_1_U0", "Port" : "split_out_0"}]},
			{"Name" : "merge_in_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "worker_1_U0", "Port" : "merge_in_0"}]},
			{"Name" : "split_out_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "worker_2_U0", "Port" : "split_out_1"}]},
			{"Name" : "merge_in_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "worker_2_U0", "Port" : "merge_in_1"}]},
			{"Name" : "split_out_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "worker_3_U0", "Port" : "split_out_2"}]},
			{"Name" : "merge_in_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "worker_3_U0", "Port" : "merge_in_2"}]},
			{"Name" : "split_out_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "worker_4_U0", "Port" : "split_out_3"}]},
			{"Name" : "merge_in_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "worker_4_U0", "Port" : "merge_in_3"}]},
			{"Name" : "split_out_4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "worker_5_U0", "Port" : "split_out_4"}]},
			{"Name" : "merge_in_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "worker_5_U0", "Port" : "merge_in_4"}]},
			{"Name" : "split_out_5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "worker_6_U0", "Port" : "split_out_5"}]},
			{"Name" : "merge_in_5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "worker_6_U0", "Port" : "merge_in_5"}]},
			{"Name" : "split_out_6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "worker_7_U0", "Port" : "split_out_6"}]},
			{"Name" : "merge_in_6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "worker_7_U0", "Port" : "merge_in_6"}]},
			{"Name" : "split_out_7", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "worker_U0", "Port" : "split_out_7"}]},
			{"Name" : "merge_in_7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "worker_U0", "Port" : "merge_in_7"}]}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.KPN_U0.worker_1_U0", "Parent" : "7",
		"CDFG" : "worker_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "split_out_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.KPN_U0.worker_2_U0", "Parent" : "7",
		"CDFG" : "worker_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "split_out_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.KPN_U0.worker_3_U0", "Parent" : "7",
		"CDFG" : "worker_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "split_out_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.KPN_U0.worker_4_U0", "Parent" : "7",
		"CDFG" : "worker_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "split_out_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.KPN_U0.worker_5_U0", "Parent" : "7",
		"CDFG" : "worker_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "split_out_4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_4_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.KPN_U0.worker_6_U0", "Parent" : "7",
		"CDFG" : "worker_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "split_out_5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_5_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.KPN_U0.worker_7_U0", "Parent" : "7",
		"CDFG" : "worker_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "split_out_6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_6_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.KPN_U0.worker_U0", "Parent" : "7",
		"CDFG" : "worker",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "split_out_7", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "22", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_7_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.write_out_U0", "Parent" : "0", "Child" : ["17", "18", "19", "20", "21"],
		"CDFG" : "write_out",
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
			{"Name" : "merge_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "23", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "n", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_r_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_r",
				"BlockSignal" : [
					{"Name" : "out_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_r_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_r"},
			{"Name" : "out_r_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_r"},
			{"Name" : "out_r_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_r"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_14_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.write_out_U0.flow_control_loop_pipe_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.write_out_U0.regslice_both_out_r_V_data_V_U", "Parent" : "16"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.write_out_U0.regslice_both_out_r_V_keep_V_U", "Parent" : "16"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.write_out_U0.regslice_both_out_r_V_strb_V_U", "Parent" : "16"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.write_out_U0.regslice_both_out_r_V_last_V_U", "Parent" : "16"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.split_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.merge_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	make_go_fast {
		in_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 1 FirstWrite -1}
		out_r_V_data_V {Type O LastRead -1 FirstWrite 1}
		out_r_V_keep_V {Type O LastRead -1 FirstWrite 1}
		out_r_V_strb_V {Type O LastRead -1 FirstWrite 1}
		out_r_V_last_V {Type O LastRead -1 FirstWrite 1}}
	read_in {
		in_r_V_data_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_keep_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_strb_V {Type I LastRead 0 FirstWrite -1}
		in_r_V_last_V {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		split_in {Type O LastRead -1 FirstWrite 1}}
	KPN {
		split_out_0 {Type I LastRead 0 FirstWrite -1}
		merge_in_0 {Type O LastRead -1 FirstWrite 0}
		split_out_1 {Type I LastRead 0 FirstWrite -1}
		merge_in_1 {Type O LastRead -1 FirstWrite 0}
		split_out_2 {Type I LastRead 0 FirstWrite -1}
		merge_in_2 {Type O LastRead -1 FirstWrite 0}
		split_out_3 {Type I LastRead 0 FirstWrite -1}
		merge_in_3 {Type O LastRead -1 FirstWrite 0}
		split_out_4 {Type I LastRead 0 FirstWrite -1}
		merge_in_4 {Type O LastRead -1 FirstWrite 0}
		split_out_5 {Type I LastRead 0 FirstWrite -1}
		merge_in_5 {Type O LastRead -1 FirstWrite 0}
		split_out_6 {Type I LastRead 0 FirstWrite -1}
		merge_in_6 {Type O LastRead -1 FirstWrite 0}
		split_out_7 {Type I LastRead 0 FirstWrite -1}
		merge_in_7 {Type O LastRead -1 FirstWrite 0}}
	worker_1 {
		split_out_0 {Type I LastRead 0 FirstWrite -1}
		merge_in_0 {Type O LastRead -1 FirstWrite 0}}
	worker_2 {
		split_out_1 {Type I LastRead 0 FirstWrite -1}
		merge_in_1 {Type O LastRead -1 FirstWrite 0}}
	worker_3 {
		split_out_2 {Type I LastRead 0 FirstWrite -1}
		merge_in_2 {Type O LastRead -1 FirstWrite 0}}
	worker_4 {
		split_out_3 {Type I LastRead 0 FirstWrite -1}
		merge_in_3 {Type O LastRead -1 FirstWrite 0}}
	worker_5 {
		split_out_4 {Type I LastRead 0 FirstWrite -1}
		merge_in_4 {Type O LastRead -1 FirstWrite 0}}
	worker_6 {
		split_out_5 {Type I LastRead 0 FirstWrite -1}
		merge_in_5 {Type O LastRead -1 FirstWrite 0}}
	worker_7 {
		split_out_6 {Type I LastRead 0 FirstWrite -1}
		merge_in_6 {Type O LastRead -1 FirstWrite 0}}
	worker {
		split_out_7 {Type I LastRead 0 FirstWrite -1}
		merge_in_7 {Type O LastRead -1 FirstWrite 0}}
	write_out {
		merge_out {Type I LastRead 1 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		out_r_V_data_V {Type O LastRead -1 FirstWrite 1}
		out_r_V_keep_V {Type O LastRead -1 FirstWrite 1}
		out_r_V_strb_V {Type O LastRead -1 FirstWrite 1}
		out_r_V_last_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 1

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	in_r_V_data_V { axis {  { in_r_TDATA in_data 0 8 } } }
	in_r_V_keep_V { axis {  { in_r_TKEEP in_data 0 1 } } }
	in_r_V_strb_V { axis {  { in_r_TSTRB in_data 0 1 } } }
	in_r_V_last_V { axis {  { in_r_TLAST in_data 0 1 }  { in_r_TVALID in_vld 0 1 }  { in_r_TREADY in_acc 1 1 } } }
	n { ap_none {  { n in_data 0 32 } } }
	out_r_V_data_V { axis {  { out_r_TDATA out_data 1 8 } } }
	out_r_V_keep_V { axis {  { out_r_TKEEP out_data 1 1 } } }
	out_r_V_strb_V { axis {  { out_r_TSTRB out_data 1 1 } } }
	out_r_V_last_V { axis {  { out_r_TLAST out_data 1 1 }  { out_r_TVALID out_vld 1 1 }  { out_r_TREADY out_acc 0 1 } } }
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
