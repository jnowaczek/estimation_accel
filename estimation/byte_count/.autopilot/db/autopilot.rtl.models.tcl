set SynModuleInfo {
  {SRCNAME byte_count_Pipeline_APPEARANCES MODELNAME byte_count_Pipeline_APPEARANCES RTLNAME byte_count_byte_count_Pipeline_APPEARANCES
    SUBMODULES {
      {MODELNAME byte_count_mux_2568_3_1_1 RTLNAME byte_count_mux_2568_3_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME byte_count_flow_control_loop_pipe_sequential_init RTLNAME byte_count_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME byte_count_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME byte_count_Pipeline_THRESHOLD MODELNAME byte_count_Pipeline_THRESHOLD RTLNAME byte_count_byte_count_Pipeline_THRESHOLD
    SUBMODULES {
      {MODELNAME byte_count_mux_2569_3_1_1 RTLNAME byte_count_mux_2569_3_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME byte_count MODELNAME byte_count RTLNAME byte_count IS_TOP 1
    SUBMODULES {
      {MODELNAME byte_count_control_s_axi RTLNAME byte_count_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME byte_count_gmem_m_axi RTLNAME byte_count_gmem_m_axi BINDTYPE interface TYPE interface_m_axi}
    }
  }
}
