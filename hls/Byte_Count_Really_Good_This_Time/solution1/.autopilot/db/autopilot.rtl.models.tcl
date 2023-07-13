set SynModuleInfo {
  {SRCNAME read_in MODELNAME read_in RTLNAME make_go_fast_read_in
    SUBMODULES {
      {MODELNAME make_go_fast_regslice_both RTLNAME make_go_fast_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME make_go_fast_regslice_both_U}
      {MODELNAME make_go_fast_flow_control_loop_pipe RTLNAME make_go_fast_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME make_go_fast_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME worker.1 MODELNAME worker_1 RTLNAME make_go_fast_worker_1}
  {SRCNAME worker.2 MODELNAME worker_2 RTLNAME make_go_fast_worker_2}
  {SRCNAME worker.3 MODELNAME worker_3 RTLNAME make_go_fast_worker_3}
  {SRCNAME worker.4 MODELNAME worker_4 RTLNAME make_go_fast_worker_4}
  {SRCNAME worker.5 MODELNAME worker_5 RTLNAME make_go_fast_worker_5}
  {SRCNAME worker.6 MODELNAME worker_6 RTLNAME make_go_fast_worker_6}
  {SRCNAME worker.7 MODELNAME worker_7 RTLNAME make_go_fast_worker_7}
  {SRCNAME worker MODELNAME worker RTLNAME make_go_fast_worker}
  {SRCNAME KPN MODELNAME KPN RTLNAME make_go_fast_KPN}
  {SRCNAME write_out MODELNAME write_out RTLNAME make_go_fast_write_out}
  {SRCNAME make_go_fast MODELNAME make_go_fast RTLNAME make_go_fast IS_TOP 1
    SUBMODULES {
      {MODELNAME make_go_fast_split_1I8O_w8_d0 RTLNAME make_go_fast_split_1I8O_w8_d0 BINDTYPE op TYPE channel IMPL simo}
      {MODELNAME make_go_fast_merge_8I1O_w8_d0 RTLNAME make_go_fast_merge_8I1O_w8_d0 BINDTYPE op TYPE channel IMPL miso}
    }
  }
}
