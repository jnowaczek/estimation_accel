-- ==============================================================
-- Generated by Vitis HLS v2023.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity make_go_fast_worker_6 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    split_out_5_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    split_out_5_empty_n : IN STD_LOGIC;
    split_out_5_read : OUT STD_LOGIC;
    merge_in_5_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    merge_in_5_full_n : IN STD_LOGIC;
    merge_in_5_write : OUT STD_LOGIC );
end;


architecture behav of make_go_fast_worker_6 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal split_out_5_blk_n : STD_LOGIC;
    signal merge_in_5_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal shl_ln24_fu_33_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


begin




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
                elsif ((not(((ap_start = ap_const_logic_0) or (merge_in_5_full_n = ap_const_logic_0) or (split_out_5_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, split_out_5_empty_n, merge_in_5_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, split_out_5_empty_n, merge_in_5_full_n)
    begin
        if (((ap_start = ap_const_logic_0) or (merge_in_5_full_n = ap_const_logic_0) or (split_out_5_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, split_out_5_empty_n, merge_in_5_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (merge_in_5_full_n = ap_const_logic_0) or (split_out_5_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, split_out_5_empty_n, merge_in_5_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (merge_in_5_full_n = ap_const_logic_0) or (split_out_5_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
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


    ap_ready_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, split_out_5_empty_n, merge_in_5_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (merge_in_5_full_n = ap_const_logic_0) or (split_out_5_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    merge_in_5_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, merge_in_5_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            merge_in_5_blk_n <= merge_in_5_full_n;
        else 
            merge_in_5_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    merge_in_5_din <= (shl_ln24_fu_33_p2 or ap_const_lv8_1);

    merge_in_5_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, split_out_5_empty_n, merge_in_5_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (merge_in_5_full_n = ap_const_logic_0) or (split_out_5_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            merge_in_5_write <= ap_const_logic_1;
        else 
            merge_in_5_write <= ap_const_logic_0;
        end if; 
    end process;

    shl_ln24_fu_33_p2 <= std_logic_vector(shift_left(unsigned(split_out_5_dout),to_integer(unsigned('0' & ap_const_lv8_1(8-1 downto 0)))));

    split_out_5_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, split_out_5_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            split_out_5_blk_n <= split_out_5_empty_n;
        else 
            split_out_5_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    split_out_5_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, split_out_5_empty_n, merge_in_5_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (merge_in_5_full_n = ap_const_logic_0) or (split_out_5_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            split_out_5_read <= ap_const_logic_1;
        else 
            split_out_5_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
