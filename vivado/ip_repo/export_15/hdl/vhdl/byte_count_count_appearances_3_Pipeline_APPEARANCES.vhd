-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity byte_count_count_appearances_3_Pipeline_APPEARANCES is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    prev : IN STD_LOGIC_VECTOR (7 downto 0);
    input_r_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    input_r_ce0 : OUT STD_LOGIC;
    input_r_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    appearances_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    appearances_ce0 : OUT STD_LOGIC;
    appearances_we0 : OUT STD_LOGIC;
    appearances_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    appearances_address1 : OUT STD_LOGIC_VECTOR (7 downto 0);
    appearances_ce1 : OUT STD_LOGIC;
    appearances_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
    prev_1_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    prev_1_out_ap_vld : OUT STD_LOGIC;
    count_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    count_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of byte_count_count_appearances_3_Pipeline_APPEARANCES is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln66_fu_130_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln66_reg_233 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln66_reg_233_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal prev_3_reg_242 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln70_fu_159_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln70_reg_249 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln68_fu_146_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln73_fu_168_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln74_fu_173_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal prev_1_fu_42 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_46 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln66_fu_136_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_allocacmp_i_3 : STD_LOGIC_VECTOR (8 downto 0);
    signal count_fu_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal count_2_fu_189_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_allocacmp_count_load_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_allocacmp_count_load_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal trunc_ln68_fu_142_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0 : BOOLEAN;
    signal ap_enable_operation_35 : BOOLEAN;
    signal ap_enable_state3_pp0_iter2_stage0 : BOOLEAN;
    signal ap_enable_operation_38 : BOOLEAN;
    signal ap_enable_operation_40 : BOOLEAN;
    signal ap_enable_state4_pp0_iter3_stage0 : BOOLEAN;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component byte_count_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component byte_count_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    count_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    count_fu_50 <= ap_const_lv32_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    count_fu_50 <= count_2_fu_189_p2;
                elsif (((icmp_ln70_reg_249 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
                    count_fu_50 <= appearances_q1;
                end if;
            end if; 
        end if;
    end process;

    i_fu_46_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln66_fu_130_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_46 <= add_ln66_fu_136_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_46 <= ap_const_lv9_0;
                end if;
            end if; 
        end if;
    end process;

    prev_1_fu_42_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    prev_1_fu_42 <= prev;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    prev_1_fu_42 <= prev_3_reg_242;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                icmp_ln66_reg_233 <= icmp_ln66_fu_130_p2;
                icmp_ln66_reg_233_pp0_iter1_reg <= icmp_ln66_reg_233;
                prev_3_reg_242 <= input_r_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                icmp_ln70_reg_249 <= icmp_ln70_fu_159_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln66_fu_136_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_3) + unsigned(ap_const_lv9_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);

    ap_block_pp0_assign_proc : process(ap_CS_fsm, ap_block_pp0_stage0_subdone)
    begin
                ap_block_pp0 <= ((ap_ST_fsm_pp0_stage0 = ap_CS_fsm) and (ap_const_boolean_1 = ap_block_pp0_stage0_subdone));
    end process;

        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln66_fu_130_p2)
    begin
        if (((icmp_ln66_fu_130_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_enable_operation_35_assign_proc : process(icmp_ln70_fu_159_p2)
    begin
                ap_enable_operation_35 <= (icmp_ln70_fu_159_p2 = ap_const_lv1_0);
    end process;


    ap_enable_operation_38_assign_proc : process(icmp_ln70_fu_159_p2)
    begin
                ap_enable_operation_38 <= (icmp_ln70_fu_159_p2 = ap_const_lv1_0);
    end process;


    ap_enable_operation_40_assign_proc : process(icmp_ln70_reg_249)
    begin
                ap_enable_operation_40 <= (icmp_ln70_reg_249 = ap_const_lv1_0);
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_enable_state3_pp0_iter2_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2)
    begin
                ap_enable_state3_pp0_iter2_stage0 <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_enable_state4_pp0_iter3_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3)
    begin
                ap_enable_state4_pp0_iter3_stage0 <= ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_count_load_1_assign_proc : process(ap_enable_reg_pp0_iter3, appearances_q1, icmp_ln70_reg_249, ap_block_pp0_stage0, count_fu_50, count_2_fu_189_p2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then
            ap_sig_allocacmp_count_load_1 <= count_2_fu_189_p2;
        end if;
    end process;


    ap_sig_allocacmp_count_load_2_assign_proc : process(ap_enable_reg_pp0_iter3, appearances_q1, icmp_ln70_reg_249, ap_block_pp0_stage0, count_fu_50)
    begin
        if (((icmp_ln70_reg_249 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            ap_sig_allocacmp_count_load_2 <= appearances_q1;
        else 
            ap_sig_allocacmp_count_load_2 <= count_fu_50;
        end if; 
    end process;


    ap_sig_allocacmp_i_3_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_46)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_3 <= ap_const_lv9_0;
        else 
            ap_sig_allocacmp_i_3 <= i_fu_46;
        end if; 
    end process;

    appearances_address0 <= zext_ln73_fu_168_p1(8 - 1 downto 0);
    appearances_address1 <= zext_ln74_fu_173_p1(8 - 1 downto 0);

    appearances_ce0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            appearances_ce0 <= ap_const_logic_1;
        else 
            appearances_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    appearances_ce1_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            appearances_ce1 <= ap_const_logic_1;
        else 
            appearances_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    appearances_d0 <= ap_sig_allocacmp_count_load_1;

    appearances_we0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001, icmp_ln70_fu_159_p2)
    begin
        if (((icmp_ln70_fu_159_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            appearances_we0 <= ap_const_logic_1;
        else 
            appearances_we0 <= ap_const_logic_0;
        end if; 
    end process;

    count_2_fu_189_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_count_load_2) + unsigned(ap_const_lv32_1));
    count_out <= count_fu_50;

    count_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln66_reg_233_pp0_iter1_reg)
    begin
        if (((icmp_ln66_reg_233_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            count_out_ap_vld <= ap_const_logic_1;
        else 
            count_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln66_fu_130_p2 <= "1" when (ap_sig_allocacmp_i_3 = ap_const_lv9_100) else "0";
    icmp_ln70_fu_159_p2 <= "1" when (prev_3_reg_242 = prev_1_fu_42) else "0";
    input_r_address0 <= zext_ln68_fu_146_p1(8 - 1 downto 0);

    input_r_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            input_r_ce0 <= ap_const_logic_1;
        else 
            input_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    prev_1_out <= prev_1_fu_42;

    prev_1_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln66_reg_233_pp0_iter1_reg)
    begin
        if (((icmp_ln66_reg_233_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            prev_1_out_ap_vld <= ap_const_logic_1;
        else 
            prev_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln68_fu_142_p1 <= ap_sig_allocacmp_i_3(8 - 1 downto 0);
    zext_ln68_fu_146_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln68_fu_142_p1),32));
    zext_ln73_fu_168_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(prev_1_fu_42),32));
    zext_ln74_fu_173_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(prev_3_reg_242),32));
end behav;
