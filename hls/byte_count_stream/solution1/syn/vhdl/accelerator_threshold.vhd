-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity accelerator_threshold is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    appear_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    appear_ce0 : OUT STD_LOGIC;
    appear_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    Out_r_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    Out_r_full_n : IN STD_LOGIC;
    Out_r_write : OUT STD_LOGIC );
end;


architecture behav of accelerator_threshold is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal Out_r_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start : STD_LOGIC;
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_done : STD_LOGIC;
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_idle : STD_LOGIC;
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_ready : STD_LOGIC;
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_appear_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_appear_ce0 : STD_LOGIC;
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_over_thresh_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_over_thresh_out_ap_vld : STD_LOGIC;
    signal grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state1_ignore_call2 : BOOLEAN;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component accelerator_threshold_Pipeline_VITIS_LOOP_54_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        appear_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        appear_ce0 : OUT STD_LOGIC;
        appear_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
        over_thresh_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        over_thresh_out_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31 : component accelerator_threshold_Pipeline_VITIS_LOOP_54_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start,
        ap_done => grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_done,
        ap_idle => grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_idle,
        ap_ready => grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_ready,
        appear_address0 => grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_appear_address0,
        appear_ce0 => grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_appear_ce0,
        appear_q0 => appear_q0,
        over_thresh_out => grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_over_thresh_out,
        over_thresh_out_ap_vld => grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_over_thresh_out_ap_vld);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
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
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_logic_1 = Out_r_full_n))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start_reg <= ap_const_logic_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_ready = ap_const_logic_1)) then 
                    grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, Out_r_full_n, ap_CS_fsm_state3, grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_logic_1 = Out_r_full_n))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;

    Out_r_blk_n_assign_proc : process(Out_r_full_n, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            Out_r_blk_n <= Out_r_full_n;
        else 
            Out_r_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    Out_r_din <= grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_over_thresh_out;

    Out_r_write_assign_proc : process(Out_r_full_n, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_logic_1 = Out_r_full_n))) then 
            Out_r_write <= ap_const_logic_1;
        else 
            Out_r_write <= ap_const_logic_0;
        end if; 
    end process;

    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_done)
    begin
        if ((grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state3_blk_assign_proc : process(Out_r_full_n)
    begin
        if ((ap_const_logic_0 = Out_r_full_n)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state1_ignore_call2_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1_ignore_call2 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, Out_r_full_n, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_logic_1 = Out_r_full_n))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(Out_r_full_n, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_logic_1 = Out_r_full_n))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    appear_address0 <= grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_appear_address0;
    appear_ce0 <= grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_appear_ce0;
    grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start <= grp_threshold_Pipeline_VITIS_LOOP_54_1_fu_31_ap_start_reg;
end behav;
