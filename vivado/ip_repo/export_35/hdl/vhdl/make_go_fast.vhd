-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity make_go_fast is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 4;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    InStream_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    InStream_TKEEP : IN STD_LOGIC_VECTOR (0 downto 0);
    InStream_TSTRB : IN STD_LOGIC_VECTOR (0 downto 0);
    InStream_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    OutStream_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    OutStream_TKEEP : OUT STD_LOGIC_VECTOR (0 downto 0);
    OutStream_TSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
    OutStream_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    InStream_TVALID : IN STD_LOGIC;
    InStream_TREADY : OUT STD_LOGIC;
    OutStream_TVALID : OUT STD_LOGIC;
    OutStream_TREADY : IN STD_LOGIC );
end;


architecture behav of make_go_fast is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "make_go_fast_make_go_fast,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=3.538000,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=1,HLS_SYN_DSP=0,HLS_SYN_FF=225,HLS_SYN_LUT=246,HLS_VERSION=2022_1}";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_ready : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal split_input_stream_U0_ap_start : STD_LOGIC;
    signal split_input_stream_U0_ap_done : STD_LOGIC;
    signal split_input_stream_U0_ap_continue : STD_LOGIC;
    signal split_input_stream_U0_ap_idle : STD_LOGIC;
    signal split_input_stream_U0_ap_ready : STD_LOGIC;
    signal split_input_stream_U0_start_out : STD_LOGIC;
    signal split_input_stream_U0_start_write : STD_LOGIC;
    signal split_input_stream_U0_InStream_TREADY : STD_LOGIC;
    signal split_input_stream_U0_split_buffer_din : STD_LOGIC_VECTOR (8 downto 0);
    signal split_input_stream_U0_split_buffer_write : STD_LOGIC;
    signal process_split_stream_U0_ap_start : STD_LOGIC;
    signal process_split_stream_U0_ap_done : STD_LOGIC;
    signal process_split_stream_U0_ap_continue : STD_LOGIC;
    signal process_split_stream_U0_ap_idle : STD_LOGIC;
    signal process_split_stream_U0_ap_ready : STD_LOGIC;
    signal process_split_stream_U0_split_buffer_read : STD_LOGIC;
    signal process_split_stream_U0_OutStream_TDATA : STD_LOGIC_VECTOR (7 downto 0);
    signal process_split_stream_U0_OutStream_TVALID : STD_LOGIC;
    signal process_split_stream_U0_OutStream_TKEEP : STD_LOGIC_VECTOR (0 downto 0);
    signal process_split_stream_U0_OutStream_TSTRB : STD_LOGIC_VECTOR (0 downto 0);
    signal process_split_stream_U0_OutStream_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal split_buffer_full_n : STD_LOGIC;
    signal split_buffer_dout : STD_LOGIC_VECTOR (8 downto 0);
    signal split_buffer_num_data_valid : STD_LOGIC_VECTOR (8 downto 0);
    signal split_buffer_fifo_cap : STD_LOGIC_VECTOR (8 downto 0);
    signal split_buffer_empty_n : STD_LOGIC;
    signal start_for_process_split_stream_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_process_split_stream_U0_full_n : STD_LOGIC;
    signal start_for_process_split_stream_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_process_split_stream_U0_empty_n : STD_LOGIC;

    component make_go_fast_split_input_stream IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        InStream_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
        InStream_TVALID : IN STD_LOGIC;
        InStream_TREADY : OUT STD_LOGIC;
        InStream_TKEEP : IN STD_LOGIC_VECTOR (0 downto 0);
        InStream_TSTRB : IN STD_LOGIC_VECTOR (0 downto 0);
        InStream_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        split_buffer_din : OUT STD_LOGIC_VECTOR (8 downto 0);
        split_buffer_num_data_valid : IN STD_LOGIC_VECTOR (8 downto 0);
        split_buffer_fifo_cap : IN STD_LOGIC_VECTOR (8 downto 0);
        split_buffer_full_n : IN STD_LOGIC;
        split_buffer_write : OUT STD_LOGIC );
    end component;


    component make_go_fast_process_split_stream IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        split_buffer_dout : IN STD_LOGIC_VECTOR (8 downto 0);
        split_buffer_num_data_valid : IN STD_LOGIC_VECTOR (8 downto 0);
        split_buffer_fifo_cap : IN STD_LOGIC_VECTOR (8 downto 0);
        split_buffer_empty_n : IN STD_LOGIC;
        split_buffer_read : OUT STD_LOGIC;
        OutStream_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
        OutStream_TVALID : OUT STD_LOGIC;
        OutStream_TREADY : IN STD_LOGIC;
        OutStream_TKEEP : OUT STD_LOGIC_VECTOR (0 downto 0);
        OutStream_TSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
        OutStream_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component make_go_fast_fifo_w9_d256_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (8 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (8 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (8 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (8 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component make_go_fast_start_for_process_split_stream_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component make_go_fast_control_s_axi IS
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
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC );
    end component;



begin
    control_s_axi_U : component make_go_fast_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle);

    split_input_stream_U0 : component make_go_fast_split_input_stream
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => split_input_stream_U0_ap_start,
        start_full_n => start_for_process_split_stream_U0_full_n,
        ap_done => split_input_stream_U0_ap_done,
        ap_continue => split_input_stream_U0_ap_continue,
        ap_idle => split_input_stream_U0_ap_idle,
        ap_ready => split_input_stream_U0_ap_ready,
        start_out => split_input_stream_U0_start_out,
        start_write => split_input_stream_U0_start_write,
        InStream_TDATA => InStream_TDATA,
        InStream_TVALID => InStream_TVALID,
        InStream_TREADY => split_input_stream_U0_InStream_TREADY,
        InStream_TKEEP => InStream_TKEEP,
        InStream_TSTRB => InStream_TSTRB,
        InStream_TLAST => InStream_TLAST,
        split_buffer_din => split_input_stream_U0_split_buffer_din,
        split_buffer_num_data_valid => split_buffer_num_data_valid,
        split_buffer_fifo_cap => split_buffer_fifo_cap,
        split_buffer_full_n => split_buffer_full_n,
        split_buffer_write => split_input_stream_U0_split_buffer_write);

    process_split_stream_U0 : component make_go_fast_process_split_stream
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => process_split_stream_U0_ap_start,
        ap_done => process_split_stream_U0_ap_done,
        ap_continue => process_split_stream_U0_ap_continue,
        ap_idle => process_split_stream_U0_ap_idle,
        ap_ready => process_split_stream_U0_ap_ready,
        split_buffer_dout => split_buffer_dout,
        split_buffer_num_data_valid => split_buffer_num_data_valid,
        split_buffer_fifo_cap => split_buffer_fifo_cap,
        split_buffer_empty_n => split_buffer_empty_n,
        split_buffer_read => process_split_stream_U0_split_buffer_read,
        OutStream_TDATA => process_split_stream_U0_OutStream_TDATA,
        OutStream_TVALID => process_split_stream_U0_OutStream_TVALID,
        OutStream_TREADY => OutStream_TREADY,
        OutStream_TKEEP => process_split_stream_U0_OutStream_TKEEP,
        OutStream_TSTRB => process_split_stream_U0_OutStream_TSTRB,
        OutStream_TLAST => process_split_stream_U0_OutStream_TLAST);

    split_buffer_U : component make_go_fast_fifo_w9_d256_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => split_input_stream_U0_split_buffer_din,
        if_full_n => split_buffer_full_n,
        if_write => split_input_stream_U0_split_buffer_write,
        if_dout => split_buffer_dout,
        if_num_data_valid => split_buffer_num_data_valid,
        if_fifo_cap => split_buffer_fifo_cap,
        if_empty_n => split_buffer_empty_n,
        if_read => process_split_stream_U0_split_buffer_read);

    start_for_process_split_stream_U0_U : component make_go_fast_start_for_process_split_stream_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_process_split_stream_U0_din,
        if_full_n => start_for_process_split_stream_U0_full_n,
        if_write => split_input_stream_U0_start_write,
        if_dout => start_for_process_split_stream_U0_dout,
        if_empty_n => start_for_process_split_stream_U0_empty_n,
        if_read => process_split_stream_U0_ap_ready);




    InStream_TREADY <= split_input_stream_U0_InStream_TREADY;
    OutStream_TDATA <= process_split_stream_U0_OutStream_TDATA;
    OutStream_TKEEP <= process_split_stream_U0_OutStream_TKEEP;
    OutStream_TLAST <= process_split_stream_U0_OutStream_TLAST;
    OutStream_TSTRB <= process_split_stream_U0_OutStream_TSTRB;
    OutStream_TVALID <= process_split_stream_U0_OutStream_TVALID;
    ap_done <= process_split_stream_U0_ap_done;
    ap_idle <= (split_input_stream_U0_ap_idle and process_split_stream_U0_ap_idle);
    ap_ready <= split_input_stream_U0_ap_ready;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    process_split_stream_U0_ap_continue <= ap_const_logic_1;
    process_split_stream_U0_ap_start <= start_for_process_split_stream_U0_empty_n;
    split_input_stream_U0_ap_continue <= ap_const_logic_1;
    split_input_stream_U0_ap_start <= ap_start;
    start_for_process_split_stream_U0_din <= (0=>ap_const_logic_1, others=>'-');
end behav;