set SynModuleInfo {
  {SRCNAME split_input_stream_Pipeline_VITIS_LOOP_16_1 MODELNAME split_input_stream_Pipeline_VITIS_LOOP_16_1 RTLNAME make_go_fast_split_input_stream_Pipeline_VITIS_LOOP_16_1
    SUBMODULES {
      {MODELNAME make_go_fast_flow_control_loop_pipe_sequential_init RTLNAME make_go_fast_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME make_go_fast_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME split_input_stream MODELNAME split_input_stream RTLNAME make_go_fast_split_input_stream
    SUBMODULES {
      {MODELNAME make_go_fast_regslice_both RTLNAME make_go_fast_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME make_go_fast_regslice_both_U}
    }
  }
  {SRCNAME process_split_stream MODELNAME process_split_stream RTLNAME make_go_fast_process_split_stream}
  {SRCNAME make_go_fast MODELNAME make_go_fast RTLNAME make_go_fast IS_TOP 1
    SUBMODULES {
      {MODELNAME make_go_fast_fifo_w9_d256_A RTLNAME make_go_fast_fifo_w9_d256_A BINDTYPE storage TYPE fifo IMPL memory ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME make_go_fast_start_for_process_split_stream_U0 RTLNAME make_go_fast_start_for_process_split_stream_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME make_go_fast_control_s_axi RTLNAME make_go_fast_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
