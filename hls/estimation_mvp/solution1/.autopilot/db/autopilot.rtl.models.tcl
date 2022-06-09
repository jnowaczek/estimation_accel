set SynModuleInfo {
  {SRCNAME count_appearances_Pipeline_APPEARANCES MODELNAME count_appearances_Pipeline_APPEARANCES RTLNAME byte_count_count_appearances_Pipeline_APPEARANCES
    SUBMODULES {
      {MODELNAME byte_count_flow_control_loop_pipe_sequential_init RTLNAME byte_count_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME byte_count_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME count_appearances MODELNAME count_appearances RTLNAME byte_count_count_appearances}
  {SRCNAME count_threshold MODELNAME count_threshold RTLNAME byte_count_count_threshold}
  {SRCNAME byte_count MODELNAME byte_count RTLNAME byte_count IS_TOP 1
    SUBMODULES {
      {MODELNAME byte_count_appearances_RAM_AUTO_1R1W_memcore RTLNAME byte_count_appearances_RAM_AUTO_1R1W_memcore BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME byte_count_appearances_RAM_AUTO_1R1W RTLNAME byte_count_appearances_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2}
      {MODELNAME byte_count_gmem_m_axi RTLNAME byte_count_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME byte_count_control_s_axi RTLNAME byte_count_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
