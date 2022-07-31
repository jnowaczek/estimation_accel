set SynModuleInfo {
  {SRCNAME count_Pipeline_APPEARANCES MODELNAME count_Pipeline_APPEARANCES RTLNAME accelerator_count_Pipeline_APPEARANCES
    SUBMODULES {
      {MODELNAME accelerator_flow_control_loop_pipe_sequential_init RTLNAME accelerator_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME accelerator_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME count MODELNAME count RTLNAME accelerator_count}
  {SRCNAME threshold_Pipeline_VITIS_LOOP_54_1 MODELNAME threshold_Pipeline_VITIS_LOOP_54_1 RTLNAME accelerator_threshold_Pipeline_VITIS_LOOP_54_1}
  {SRCNAME threshold MODELNAME threshold RTLNAME accelerator_threshold}
  {SRCNAME accelerator MODELNAME accelerator RTLNAME accelerator IS_TOP 1
    SUBMODULES {
      {MODELNAME accelerator_appear_RAM_AUTO_1R1W_memcore RTLNAME accelerator_appear_RAM_AUTO_1R1W_memcore BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME accelerator_appear_RAM_AUTO_1R1W RTLNAME accelerator_appear_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2}
    }
  }
}
