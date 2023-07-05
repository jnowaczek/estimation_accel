set moduleName KPN
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {KPN}
set C_modelType { void 0 }
set C_modelArgList {
	{ split_out_0 int 8 regular {fifo 0 volatile }  }
	{ merge_in_0 int 8 regular {fifo 1 volatile }  }
	{ split_out_1 int 8 regular {fifo 0 volatile }  }
	{ merge_in_1 int 8 regular {fifo 1 volatile }  }
	{ split_out_2 int 8 regular {fifo 0 volatile }  }
	{ merge_in_2 int 8 regular {fifo 1 volatile }  }
	{ split_out_3 int 8 regular {fifo 0 volatile }  }
	{ merge_in_3 int 8 regular {fifo 1 volatile }  }
	{ split_out_4 int 8 regular {fifo 0 volatile }  }
	{ merge_in_4 int 8 regular {fifo 1 volatile }  }
	{ split_out_5 int 8 regular {fifo 0 volatile }  }
	{ merge_in_5 int 8 regular {fifo 1 volatile }  }
	{ split_out_6 int 8 regular {fifo 0 volatile }  }
	{ merge_in_6 int 8 regular {fifo 1 volatile }  }
	{ split_out_7 int 8 regular {fifo 0 volatile }  }
	{ merge_in_7 int 8 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "split_out_0", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "merge_in_0", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split_out_1", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "merge_in_1", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split_out_2", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "merge_in_2", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split_out_3", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "merge_in_3", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split_out_4", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "merge_in_4", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split_out_5", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "merge_in_5", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split_out_6", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "merge_in_6", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "split_out_7", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "merge_in_7", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 51
set portList { 
	{ split_out_0_dout sc_in sc_lv 8 signal 0 } 
	{ split_out_0_empty_n sc_in sc_logic 1 signal 0 } 
	{ split_out_0_read sc_out sc_logic 1 signal 0 } 
	{ merge_in_0_din sc_out sc_lv 8 signal 1 } 
	{ merge_in_0_full_n sc_in sc_logic 1 signal 1 } 
	{ merge_in_0_write sc_out sc_logic 1 signal 1 } 
	{ split_out_1_dout sc_in sc_lv 8 signal 2 } 
	{ split_out_1_empty_n sc_in sc_logic 1 signal 2 } 
	{ split_out_1_read sc_out sc_logic 1 signal 2 } 
	{ merge_in_1_din sc_out sc_lv 8 signal 3 } 
	{ merge_in_1_full_n sc_in sc_logic 1 signal 3 } 
	{ merge_in_1_write sc_out sc_logic 1 signal 3 } 
	{ split_out_2_dout sc_in sc_lv 8 signal 4 } 
	{ split_out_2_empty_n sc_in sc_logic 1 signal 4 } 
	{ split_out_2_read sc_out sc_logic 1 signal 4 } 
	{ merge_in_2_din sc_out sc_lv 8 signal 5 } 
	{ merge_in_2_full_n sc_in sc_logic 1 signal 5 } 
	{ merge_in_2_write sc_out sc_logic 1 signal 5 } 
	{ split_out_3_dout sc_in sc_lv 8 signal 6 } 
	{ split_out_3_empty_n sc_in sc_logic 1 signal 6 } 
	{ split_out_3_read sc_out sc_logic 1 signal 6 } 
	{ merge_in_3_din sc_out sc_lv 8 signal 7 } 
	{ merge_in_3_full_n sc_in sc_logic 1 signal 7 } 
	{ merge_in_3_write sc_out sc_logic 1 signal 7 } 
	{ split_out_4_dout sc_in sc_lv 8 signal 8 } 
	{ split_out_4_empty_n sc_in sc_logic 1 signal 8 } 
	{ split_out_4_read sc_out sc_logic 1 signal 8 } 
	{ merge_in_4_din sc_out sc_lv 8 signal 9 } 
	{ merge_in_4_full_n sc_in sc_logic 1 signal 9 } 
	{ merge_in_4_write sc_out sc_logic 1 signal 9 } 
	{ split_out_5_dout sc_in sc_lv 8 signal 10 } 
	{ split_out_5_empty_n sc_in sc_logic 1 signal 10 } 
	{ split_out_5_read sc_out sc_logic 1 signal 10 } 
	{ merge_in_5_din sc_out sc_lv 8 signal 11 } 
	{ merge_in_5_full_n sc_in sc_logic 1 signal 11 } 
	{ merge_in_5_write sc_out sc_logic 1 signal 11 } 
	{ split_out_6_dout sc_in sc_lv 8 signal 12 } 
	{ split_out_6_empty_n sc_in sc_logic 1 signal 12 } 
	{ split_out_6_read sc_out sc_logic 1 signal 12 } 
	{ merge_in_6_din sc_out sc_lv 8 signal 13 } 
	{ merge_in_6_full_n sc_in sc_logic 1 signal 13 } 
	{ merge_in_6_write sc_out sc_logic 1 signal 13 } 
	{ split_out_7_dout sc_in sc_lv 8 signal 14 } 
	{ split_out_7_empty_n sc_in sc_logic 1 signal 14 } 
	{ split_out_7_read sc_out sc_logic 1 signal 14 } 
	{ merge_in_7_din sc_out sc_lv 8 signal 15 } 
	{ merge_in_7_full_n sc_in sc_logic 1 signal 15 } 
	{ merge_in_7_write sc_out sc_logic 1 signal 15 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
}
set NewPortList {[ 
	{ "name": "split_out_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_out_0", "role": "dout" }} , 
 	{ "name": "split_out_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_0", "role": "empty_n" }} , 
 	{ "name": "split_out_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_0", "role": "read" }} , 
 	{ "name": "merge_in_0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "merge_in_0", "role": "din" }} , 
 	{ "name": "merge_in_0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_0", "role": "full_n" }} , 
 	{ "name": "merge_in_0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_0", "role": "write" }} , 
 	{ "name": "split_out_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_out_1", "role": "dout" }} , 
 	{ "name": "split_out_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_1", "role": "empty_n" }} , 
 	{ "name": "split_out_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_1", "role": "read" }} , 
 	{ "name": "merge_in_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "merge_in_1", "role": "din" }} , 
 	{ "name": "merge_in_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_1", "role": "full_n" }} , 
 	{ "name": "merge_in_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_1", "role": "write" }} , 
 	{ "name": "split_out_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_out_2", "role": "dout" }} , 
 	{ "name": "split_out_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_2", "role": "empty_n" }} , 
 	{ "name": "split_out_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_2", "role": "read" }} , 
 	{ "name": "merge_in_2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "merge_in_2", "role": "din" }} , 
 	{ "name": "merge_in_2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_2", "role": "full_n" }} , 
 	{ "name": "merge_in_2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_2", "role": "write" }} , 
 	{ "name": "split_out_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_out_3", "role": "dout" }} , 
 	{ "name": "split_out_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_3", "role": "empty_n" }} , 
 	{ "name": "split_out_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_3", "role": "read" }} , 
 	{ "name": "merge_in_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "merge_in_3", "role": "din" }} , 
 	{ "name": "merge_in_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_3", "role": "full_n" }} , 
 	{ "name": "merge_in_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_3", "role": "write" }} , 
 	{ "name": "split_out_4_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_out_4", "role": "dout" }} , 
 	{ "name": "split_out_4_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_4", "role": "empty_n" }} , 
 	{ "name": "split_out_4_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_4", "role": "read" }} , 
 	{ "name": "merge_in_4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "merge_in_4", "role": "din" }} , 
 	{ "name": "merge_in_4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_4", "role": "full_n" }} , 
 	{ "name": "merge_in_4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_4", "role": "write" }} , 
 	{ "name": "split_out_5_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_out_5", "role": "dout" }} , 
 	{ "name": "split_out_5_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_5", "role": "empty_n" }} , 
 	{ "name": "split_out_5_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_5", "role": "read" }} , 
 	{ "name": "merge_in_5_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "merge_in_5", "role": "din" }} , 
 	{ "name": "merge_in_5_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_5", "role": "full_n" }} , 
 	{ "name": "merge_in_5_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_5", "role": "write" }} , 
 	{ "name": "split_out_6_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_out_6", "role": "dout" }} , 
 	{ "name": "split_out_6_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_6", "role": "empty_n" }} , 
 	{ "name": "split_out_6_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_6", "role": "read" }} , 
 	{ "name": "merge_in_6_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "merge_in_6", "role": "din" }} , 
 	{ "name": "merge_in_6_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_6", "role": "full_n" }} , 
 	{ "name": "merge_in_6_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_6", "role": "write" }} , 
 	{ "name": "split_out_7_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "split_out_7", "role": "dout" }} , 
 	{ "name": "split_out_7_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_7", "role": "empty_n" }} , 
 	{ "name": "split_out_7_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "split_out_7", "role": "read" }} , 
 	{ "name": "merge_in_7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "merge_in_7", "role": "din" }} , 
 	{ "name": "merge_in_7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_7", "role": "full_n" }} , 
 	{ "name": "merge_in_7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "merge_in_7", "role": "write" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
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
			{"ID" : "1", "Name" : "worker_1_U0"},
			{"ID" : "2", "Name" : "worker_2_U0"},
			{"ID" : "3", "Name" : "worker_3_U0"},
			{"ID" : "4", "Name" : "worker_4_U0"},
			{"ID" : "5", "Name" : "worker_5_U0"},
			{"ID" : "6", "Name" : "worker_6_U0"},
			{"ID" : "7", "Name" : "worker_7_U0"},
			{"ID" : "8", "Name" : "worker_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "worker_1_U0"},
			{"ID" : "2", "Name" : "worker_2_U0"},
			{"ID" : "3", "Name" : "worker_3_U0"},
			{"ID" : "4", "Name" : "worker_4_U0"},
			{"ID" : "5", "Name" : "worker_5_U0"},
			{"ID" : "6", "Name" : "worker_6_U0"},
			{"ID" : "7", "Name" : "worker_7_U0"},
			{"ID" : "8", "Name" : "worker_U0"}],
		"Port" : [
			{"Name" : "split_out_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "worker_1_U0", "Port" : "split_out_0"}]},
			{"Name" : "merge_in_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "worker_1_U0", "Port" : "merge_in_0"}]},
			{"Name" : "split_out_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "worker_2_U0", "Port" : "split_out_1"}]},
			{"Name" : "merge_in_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "worker_2_U0", "Port" : "merge_in_1"}]},
			{"Name" : "split_out_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "worker_3_U0", "Port" : "split_out_2"}]},
			{"Name" : "merge_in_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "worker_3_U0", "Port" : "merge_in_2"}]},
			{"Name" : "split_out_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "worker_4_U0", "Port" : "split_out_3"}]},
			{"Name" : "merge_in_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "worker_4_U0", "Port" : "merge_in_3"}]},
			{"Name" : "split_out_4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "worker_5_U0", "Port" : "split_out_4"}]},
			{"Name" : "merge_in_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "worker_5_U0", "Port" : "merge_in_4"}]},
			{"Name" : "split_out_5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "worker_6_U0", "Port" : "split_out_5"}]},
			{"Name" : "merge_in_5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "worker_6_U0", "Port" : "merge_in_5"}]},
			{"Name" : "split_out_6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "worker_7_U0", "Port" : "split_out_6"}]},
			{"Name" : "merge_in_6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "worker_7_U0", "Port" : "merge_in_6"}]},
			{"Name" : "split_out_7", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "worker_U0", "Port" : "split_out_7"}]},
			{"Name" : "merge_in_7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "worker_U0", "Port" : "merge_in_7"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.worker_1_U0", "Parent" : "0",
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
			{"Name" : "split_out_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.worker_2_U0", "Parent" : "0",
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
			{"Name" : "split_out_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.worker_3_U0", "Parent" : "0",
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
			{"Name" : "split_out_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.worker_4_U0", "Parent" : "0",
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
			{"Name" : "split_out_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.worker_5_U0", "Parent" : "0",
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
			{"Name" : "split_out_4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_4_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.worker_6_U0", "Parent" : "0",
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
			{"Name" : "split_out_5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_5_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.worker_7_U0", "Parent" : "0",
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
			{"Name" : "split_out_6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_6_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.worker_U0", "Parent" : "0",
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
			{"Name" : "split_out_7", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "split_out_7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "merge_in_7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "0", "DependentChanType" : "4",
				"BlockSignal" : [
					{"Name" : "merge_in_7_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
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
		merge_in_7 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 1

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	split_out_0 { ap_fifo {  { split_out_0_dout fifo_port_we 0 8 }  { split_out_0_empty_n fifo_status 0 1 }  { split_out_0_read fifo_data 1 1 } } }
	merge_in_0 { ap_fifo {  { merge_in_0_din fifo_port_we 1 8 }  { merge_in_0_full_n fifo_status 0 1 }  { merge_in_0_write fifo_data 1 1 } } }
	split_out_1 { ap_fifo {  { split_out_1_dout fifo_port_we 0 8 }  { split_out_1_empty_n fifo_status 0 1 }  { split_out_1_read fifo_data 1 1 } } }
	merge_in_1 { ap_fifo {  { merge_in_1_din fifo_port_we 1 8 }  { merge_in_1_full_n fifo_status 0 1 }  { merge_in_1_write fifo_data 1 1 } } }
	split_out_2 { ap_fifo {  { split_out_2_dout fifo_port_we 0 8 }  { split_out_2_empty_n fifo_status 0 1 }  { split_out_2_read fifo_data 1 1 } } }
	merge_in_2 { ap_fifo {  { merge_in_2_din fifo_port_we 1 8 }  { merge_in_2_full_n fifo_status 0 1 }  { merge_in_2_write fifo_data 1 1 } } }
	split_out_3 { ap_fifo {  { split_out_3_dout fifo_port_we 0 8 }  { split_out_3_empty_n fifo_status 0 1 }  { split_out_3_read fifo_data 1 1 } } }
	merge_in_3 { ap_fifo {  { merge_in_3_din fifo_port_we 1 8 }  { merge_in_3_full_n fifo_status 0 1 }  { merge_in_3_write fifo_data 1 1 } } }
	split_out_4 { ap_fifo {  { split_out_4_dout fifo_port_we 0 8 }  { split_out_4_empty_n fifo_status 0 1 }  { split_out_4_read fifo_data 1 1 } } }
	merge_in_4 { ap_fifo {  { merge_in_4_din fifo_port_we 1 8 }  { merge_in_4_full_n fifo_status 0 1 }  { merge_in_4_write fifo_data 1 1 } } }
	split_out_5 { ap_fifo {  { split_out_5_dout fifo_port_we 0 8 }  { split_out_5_empty_n fifo_status 0 1 }  { split_out_5_read fifo_data 1 1 } } }
	merge_in_5 { ap_fifo {  { merge_in_5_din fifo_port_we 1 8 }  { merge_in_5_full_n fifo_status 0 1 }  { merge_in_5_write fifo_data 1 1 } } }
	split_out_6 { ap_fifo {  { split_out_6_dout fifo_port_we 0 8 }  { split_out_6_empty_n fifo_status 0 1 }  { split_out_6_read fifo_data 1 1 } } }
	merge_in_6 { ap_fifo {  { merge_in_6_din fifo_port_we 1 8 }  { merge_in_6_full_n fifo_status 0 1 }  { merge_in_6_write fifo_data 1 1 } } }
	split_out_7 { ap_fifo {  { split_out_7_dout fifo_port_we 0 8 }  { split_out_7_empty_n fifo_status 0 1 }  { split_out_7_read fifo_data 1 1 } } }
	merge_in_7 { ap_fifo {  { merge_in_7_din fifo_port_we 1 8 }  { merge_in_7_full_n fifo_status 0 1 }  { merge_in_7_write fifo_data 1 1 } } }
}
