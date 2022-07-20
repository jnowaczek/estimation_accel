set SynModuleInfo {
  {SRCNAME split MODELNAME split RTLNAME accelerator_split}
  {SRCNAME count0_Pipeline_APPEARANCES MODELNAME count0_Pipeline_APPEARANCES RTLNAME accelerator_count0_Pipeline_APPEARANCES
    SUBMODULES {
      {MODELNAME accelerator_flow_control_loop_pipe_sequential_init RTLNAME accelerator_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME accelerator_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME count0 MODELNAME count0 RTLNAME accelerator_count0}
  {SRCNAME count1_Pipeline_APPEARANCES MODELNAME count1_Pipeline_APPEARANCES RTLNAME accelerator_count1_Pipeline_APPEARANCES}
  {SRCNAME count1 MODELNAME count1 RTLNAME accelerator_count1}
  {SRCNAME count2_Pipeline_APPEARANCES MODELNAME count2_Pipeline_APPEARANCES RTLNAME accelerator_count2_Pipeline_APPEARANCES}
  {SRCNAME count2 MODELNAME count2 RTLNAME accelerator_count2}
  {SRCNAME count3_Pipeline_APPEARANCES MODELNAME count3_Pipeline_APPEARANCES RTLNAME accelerator_count3_Pipeline_APPEARANCES}
  {SRCNAME count3 MODELNAME count3 RTLNAME accelerator_count3}
  {SRCNAME reduce MODELNAME reduce RTLNAME accelerator_reduce}
  {SRCNAME threshold_Pipeline_VITIS_LOOP_214_1 MODELNAME threshold_Pipeline_VITIS_LOOP_214_1 RTLNAME accelerator_threshold_Pipeline_VITIS_LOOP_214_1}
  {SRCNAME threshold MODELNAME threshold RTLNAME accelerator_threshold}
  {SRCNAME accelerator MODELNAME accelerator RTLNAME accelerator IS_TOP 1
    SUBMODULES {
      {MODELNAME accelerator_input0_buf_data_RAM_AUTO_1R1W_memcore RTLNAME accelerator_input0_buf_data_RAM_AUTO_1R1W_memcore BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME accelerator_input0_buf_data_RAM_AUTO_1R1W RTLNAME accelerator_input0_buf_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2}
      {MODELNAME accelerator_reduced_blocks_buf_data_RAM_AUTO_1R1W_memcore RTLNAME accelerator_reduced_blocks_buf_data_RAM_AUTO_1R1W_memcore BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME accelerator_reduced_blocks_buf_data_RAM_AUTO_1R1W RTLNAME accelerator_reduced_blocks_buf_data_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2}
      {MODELNAME accelerator_fifo_w2048_d2_S RTLNAME accelerator_fifo_w2048_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME accelerator_start_for_count0_U0 RTLNAME accelerator_start_for_count0_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME accelerator_start_for_count1_U0 RTLNAME accelerator_start_for_count1_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME accelerator_start_for_count2_U0 RTLNAME accelerator_start_for_count2_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME accelerator_start_for_count3_U0 RTLNAME accelerator_start_for_count3_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME accelerator_start_for_threshold_U0 RTLNAME accelerator_start_for_threshold_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
}
