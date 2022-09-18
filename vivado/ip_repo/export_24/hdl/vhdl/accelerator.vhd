-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity accelerator is
generic (
    C_S_AXI_NUM_BLOCKS_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_NUM_BLOCKS_DATA_WIDTH : INTEGER := 32 );
port (
    s_axi_num_blocks_AWVALID : IN STD_LOGIC;
    s_axi_num_blocks_AWREADY : OUT STD_LOGIC;
    s_axi_num_blocks_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_NUM_BLOCKS_ADDR_WIDTH-1 downto 0);
    s_axi_num_blocks_WVALID : IN STD_LOGIC;
    s_axi_num_blocks_WREADY : OUT STD_LOGIC;
    s_axi_num_blocks_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_NUM_BLOCKS_DATA_WIDTH-1 downto 0);
    s_axi_num_blocks_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_NUM_BLOCKS_DATA_WIDTH/8-1 downto 0);
    s_axi_num_blocks_ARVALID : IN STD_LOGIC;
    s_axi_num_blocks_ARREADY : OUT STD_LOGIC;
    s_axi_num_blocks_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_NUM_BLOCKS_ADDR_WIDTH-1 downto 0);
    s_axi_num_blocks_RVALID : OUT STD_LOGIC;
    s_axi_num_blocks_RREADY : IN STD_LOGIC;
    s_axi_num_blocks_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_NUM_BLOCKS_DATA_WIDTH-1 downto 0);
    s_axi_num_blocks_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_num_blocks_BVALID : OUT STD_LOGIC;
    s_axi_num_blocks_BREADY : IN STD_LOGIC;
    s_axi_num_blocks_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    In_r_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    Out_r_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    In_r_TVALID : IN STD_LOGIC;
    In_r_TREADY : OUT STD_LOGIC;
    Out_r_TVALID : OUT STD_LOGIC;
    Out_r_TREADY : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC );
end;


architecture behav of accelerator is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "accelerator_accelerator,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010i-clg225-1L,HLS_INPUT_CLOCK=9.359000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.659300,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=958,HLS_SYN_LUT=2856,HLS_VERSION=2022_1}";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal num_blocks : STD_LOGIC_VECTOR (31 downto 0);
    signal dataflow_in_loop_VITIS_LOOP_13_1_U0_Out_r_TDATA : STD_LOGIC_VECTOR (31 downto 0);
    signal dataflow_in_loop_VITIS_LOOP_13_1_U0_In_r_TREADY : STD_LOGIC;
    signal dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_start : STD_LOGIC;
    signal dataflow_in_loop_VITIS_LOOP_13_1_U0_Out_r_TVALID : STD_LOGIC;
    signal dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_done : STD_LOGIC;
    signal dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_ready : STD_LOGIC;
    signal dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_idle : STD_LOGIC;
    signal dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_continue : STD_LOGIC;
    signal ap_bound_full_n : STD_LOGIC;
    signal ap_bound_write : STD_LOGIC;
    signal ap_bound_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_bound_empty_n : STD_LOGIC;
    signal ap_bound_read : STD_LOGIC;
    signal ap_loop_dataflow_input_count : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_loop_dataflow_output_count : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_bound_minus_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_bound_minus_1_output : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_real_start : STD_LOGIC;
    signal ap_partial_ready : STD_LOGIC;
    signal ap_internal_ready : STD_LOGIC;
    signal ap_internal_done : STD_LOGIC;
    signal ap_bound_ack : STD_LOGIC;
    signal ap_bound_reg_ack : STD_LOGIC := '0';
    signal ap_ce_reg : STD_LOGIC;

    component accelerator_dataflow_in_loop_VITIS_LOOP_13_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        In_r_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
        Out_r_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
        In_r_TVALID : IN STD_LOGIC;
        In_r_TREADY : OUT STD_LOGIC;
        ap_start : IN STD_LOGIC;
        Out_r_TVALID : OUT STD_LOGIC;
        Out_r_TREADY : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;


    component accelerator_ap_bound IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component accelerator_num_blocks_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        num_blocks : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    num_blocks_s_axi_U : component accelerator_num_blocks_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_NUM_BLOCKS_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_NUM_BLOCKS_DATA_WIDTH)
    port map (
        AWVALID => s_axi_num_blocks_AWVALID,
        AWREADY => s_axi_num_blocks_AWREADY,
        AWADDR => s_axi_num_blocks_AWADDR,
        WVALID => s_axi_num_blocks_WVALID,
        WREADY => s_axi_num_blocks_WREADY,
        WDATA => s_axi_num_blocks_WDATA,
        WSTRB => s_axi_num_blocks_WSTRB,
        ARVALID => s_axi_num_blocks_ARVALID,
        ARREADY => s_axi_num_blocks_ARREADY,
        ARADDR => s_axi_num_blocks_ARADDR,
        RVALID => s_axi_num_blocks_RVALID,
        RREADY => s_axi_num_blocks_RREADY,
        RDATA => s_axi_num_blocks_RDATA,
        RRESP => s_axi_num_blocks_RRESP,
        BVALID => s_axi_num_blocks_BVALID,
        BREADY => s_axi_num_blocks_BREADY,
        BRESP => s_axi_num_blocks_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        num_blocks => num_blocks);

    dataflow_in_loop_VITIS_LOOP_13_1_U0 : component accelerator_dataflow_in_loop_VITIS_LOOP_13_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        In_r_TDATA => In_r_TDATA,
        Out_r_TDATA => dataflow_in_loop_VITIS_LOOP_13_1_U0_Out_r_TDATA,
        In_r_TVALID => In_r_TVALID,
        In_r_TREADY => dataflow_in_loop_VITIS_LOOP_13_1_U0_In_r_TREADY,
        ap_start => dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_start,
        Out_r_TVALID => dataflow_in_loop_VITIS_LOOP_13_1_U0_Out_r_TVALID,
        Out_r_TREADY => Out_r_TREADY,
        ap_done => dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_done,
        ap_ready => dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_ready,
        ap_idle => dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_idle,
        ap_continue => dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_continue);

    ap_bound_U : component accelerator_ap_bound
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => num_blocks,
        if_full_n => ap_bound_full_n,
        if_write => ap_bound_write,
        if_dout => ap_bound_dout,
        if_empty_n => ap_bound_empty_n,
        if_read => ap_bound_read);





    ap_bound_reg_ack_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_bound_reg_ack <= ap_const_logic_0;
            else
                if (((ap_internal_ready = ap_const_logic_0) and (ap_start = ap_const_logic_1))) then 
                    ap_bound_reg_ack <= ap_bound_ack;
                else 
                    ap_bound_reg_ack <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_loop_dataflow_input_count_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_loop_dataflow_input_count <= ap_const_lv32_0;
            else
                if ((not((ap_loop_dataflow_input_count = ap_bound_minus_1)) and (ap_real_start = ap_const_logic_1) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_ready = ap_const_logic_1))) then 
                    ap_loop_dataflow_input_count <= std_logic_vector(unsigned(ap_loop_dataflow_input_count) + unsigned(ap_const_lv32_1));
                elsif (((ap_real_start = ap_const_logic_1) and (ap_loop_dataflow_input_count = ap_bound_minus_1) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_ready = ap_const_logic_1))) then 
                    ap_loop_dataflow_input_count <= ap_const_lv32_0;
                end if; 
            end if;
        end if;
    end process;


    ap_loop_dataflow_output_count_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_loop_dataflow_output_count <= ap_const_lv32_0;
            else
                if ((not((ap_loop_dataflow_output_count = ap_bound_minus_1_output)) and (unsigned(ap_const_lv32_0) < unsigned(ap_bound_dout)) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_continue = ap_const_logic_1) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_bound_empty_n))) then 
                    ap_loop_dataflow_output_count <= std_logic_vector(unsigned(ap_loop_dataflow_output_count) + unsigned(ap_const_lv32_1));
                elsif (((unsigned(ap_const_lv32_0) < unsigned(ap_bound_dout)) and (ap_loop_dataflow_output_count = ap_bound_minus_1_output) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_continue = ap_const_logic_1) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_bound_empty_n))) then 
                    ap_loop_dataflow_output_count <= ap_const_lv32_0;
                end if; 
            end if;
        end if;
    end process;

    In_r_TREADY <= dataflow_in_loop_VITIS_LOOP_13_1_U0_In_r_TREADY;
    Out_r_TDATA <= dataflow_in_loop_VITIS_LOOP_13_1_U0_Out_r_TDATA;
    Out_r_TVALID <= dataflow_in_loop_VITIS_LOOP_13_1_U0_Out_r_TVALID;
    ap_bound_ack <= (ap_bound_reg_ack or ap_bound_full_n);
    ap_bound_minus_1 <= std_logic_vector(unsigned(num_blocks) - unsigned(ap_const_lv32_1));
    ap_bound_minus_1_output <= std_logic_vector(unsigned(ap_bound_dout) - unsigned(ap_const_lv32_1));
    ap_bound_read <= (ap_internal_done and ap_continue and ap_bound_empty_n);

    ap_bound_write_assign_proc : process(ap_start, ap_bound_reg_ack)
    begin
        if (((ap_const_logic_0 = ap_bound_reg_ack) and (ap_start = ap_const_logic_1))) then 
            ap_bound_write <= ap_const_logic_1;
        else 
            ap_bound_write <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_internal_done;

    ap_idle_assign_proc : process(dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_idle, ap_start, ap_bound_empty_n, ap_loop_dataflow_output_count)
    begin
        if (((ap_const_logic_0 = ap_bound_empty_n) and (ap_loop_dataflow_output_count = ap_const_lv32_0) and (ap_start = ap_const_logic_0) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_idle = ap_const_logic_1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_internal_done_assign_proc : process(dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_done, ap_bound_dout, ap_bound_empty_n, ap_loop_dataflow_output_count, ap_bound_minus_1_output)
    begin
        if (((ap_const_logic_1 = ap_bound_empty_n) and ((ap_const_lv32_0 = ap_bound_dout) or ((ap_loop_dataflow_output_count = ap_bound_minus_1_output) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_done = ap_const_logic_1))))) then 
            ap_internal_done <= ap_const_logic_1;
        else 
            ap_internal_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_internal_ready_assign_proc : process(num_blocks, ap_start, ap_partial_ready)
    begin
        if (((ap_partial_ready = ap_const_logic_1) or ((unsigned(num_blocks) <= unsigned(ap_const_lv32_0)) and (ap_start = ap_const_logic_1)))) then 
            ap_internal_ready <= ap_const_logic_1;
        else 
            ap_internal_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_partial_ready_assign_proc : process(dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_ready, ap_loop_dataflow_input_count, ap_bound_minus_1, ap_real_start)
    begin
        if (((ap_real_start = ap_const_logic_1) and (ap_loop_dataflow_input_count = ap_bound_minus_1) and (dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_ready = ap_const_logic_1))) then 
            ap_partial_ready <= ap_const_logic_1;
        else 
            ap_partial_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= ap_internal_ready;

    ap_real_start_assign_proc : process(num_blocks, ap_start, ap_bound_ack)
    begin
        if ((not((unsigned(num_blocks) <= unsigned(ap_const_lv32_0))) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_bound_ack))) then 
            ap_real_start <= ap_const_logic_1;
        else 
            ap_real_start <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_continue_assign_proc : process(ap_continue, ap_loop_dataflow_output_count, ap_bound_minus_1_output)
    begin
        if ((not((ap_loop_dataflow_output_count = ap_bound_minus_1_output)) or (ap_continue = ap_const_logic_1))) then 
            dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_continue <= ap_const_logic_1;
        else 
            dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_continue <= ap_const_logic_0;
        end if; 
    end process;

    dataflow_in_loop_VITIS_LOOP_13_1_U0_ap_start <= ap_real_start;
end behav;
