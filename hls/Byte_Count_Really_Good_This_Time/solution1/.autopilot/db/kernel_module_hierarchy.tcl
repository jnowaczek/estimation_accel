set ModuleHierarchy {[{
"Name" : "make_go_fast","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "read_in_U0","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_4_1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "write_out_U0","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_14_1","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "KPN_U0","ID" : "5","Type" : "dataflow",
		"SubInsts" : [
		{"Name" : "worker_1_U0","ID" : "6","Type" : "sequential"},
		{"Name" : "worker_2_U0","ID" : "7","Type" : "sequential"},
		{"Name" : "worker_3_U0","ID" : "8","Type" : "sequential"},
		{"Name" : "worker_4_U0","ID" : "9","Type" : "sequential"},
		{"Name" : "worker_5_U0","ID" : "10","Type" : "sequential"},
		{"Name" : "worker_6_U0","ID" : "11","Type" : "sequential"},
		{"Name" : "worker_7_U0","ID" : "12","Type" : "sequential"},
		{"Name" : "worker_U0","ID" : "13","Type" : "sequential"},]},]
}]}