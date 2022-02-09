-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity byte_count_mux_2568_3_2_1 is
generic (
    ID            :integer := 0;
    NUM_STAGE     :integer := 1;
    din0_WIDTH       :integer := 32;
    din1_WIDTH       :integer := 32;
    din2_WIDTH       :integer := 32;
    din3_WIDTH       :integer := 32;
    din4_WIDTH       :integer := 32;
    din5_WIDTH       :integer := 32;
    din6_WIDTH       :integer := 32;
    din7_WIDTH       :integer := 32;
    din8_WIDTH       :integer := 32;
    din9_WIDTH       :integer := 32;
    din10_WIDTH       :integer := 32;
    din11_WIDTH       :integer := 32;
    din12_WIDTH       :integer := 32;
    din13_WIDTH       :integer := 32;
    din14_WIDTH       :integer := 32;
    din15_WIDTH       :integer := 32;
    din16_WIDTH       :integer := 32;
    din17_WIDTH       :integer := 32;
    din18_WIDTH       :integer := 32;
    din19_WIDTH       :integer := 32;
    din20_WIDTH       :integer := 32;
    din21_WIDTH       :integer := 32;
    din22_WIDTH       :integer := 32;
    din23_WIDTH       :integer := 32;
    din24_WIDTH       :integer := 32;
    din25_WIDTH       :integer := 32;
    din26_WIDTH       :integer := 32;
    din27_WIDTH       :integer := 32;
    din28_WIDTH       :integer := 32;
    din29_WIDTH       :integer := 32;
    din30_WIDTH       :integer := 32;
    din31_WIDTH       :integer := 32;
    din32_WIDTH       :integer := 32;
    din33_WIDTH       :integer := 32;
    din34_WIDTH       :integer := 32;
    din35_WIDTH       :integer := 32;
    din36_WIDTH       :integer := 32;
    din37_WIDTH       :integer := 32;
    din38_WIDTH       :integer := 32;
    din39_WIDTH       :integer := 32;
    din40_WIDTH       :integer := 32;
    din41_WIDTH       :integer := 32;
    din42_WIDTH       :integer := 32;
    din43_WIDTH       :integer := 32;
    din44_WIDTH       :integer := 32;
    din45_WIDTH       :integer := 32;
    din46_WIDTH       :integer := 32;
    din47_WIDTH       :integer := 32;
    din48_WIDTH       :integer := 32;
    din49_WIDTH       :integer := 32;
    din50_WIDTH       :integer := 32;
    din51_WIDTH       :integer := 32;
    din52_WIDTH       :integer := 32;
    din53_WIDTH       :integer := 32;
    din54_WIDTH       :integer := 32;
    din55_WIDTH       :integer := 32;
    din56_WIDTH       :integer := 32;
    din57_WIDTH       :integer := 32;
    din58_WIDTH       :integer := 32;
    din59_WIDTH       :integer := 32;
    din60_WIDTH       :integer := 32;
    din61_WIDTH       :integer := 32;
    din62_WIDTH       :integer := 32;
    din63_WIDTH       :integer := 32;
    din64_WIDTH       :integer := 32;
    din65_WIDTH       :integer := 32;
    din66_WIDTH       :integer := 32;
    din67_WIDTH       :integer := 32;
    din68_WIDTH       :integer := 32;
    din69_WIDTH       :integer := 32;
    din70_WIDTH       :integer := 32;
    din71_WIDTH       :integer := 32;
    din72_WIDTH       :integer := 32;
    din73_WIDTH       :integer := 32;
    din74_WIDTH       :integer := 32;
    din75_WIDTH       :integer := 32;
    din76_WIDTH       :integer := 32;
    din77_WIDTH       :integer := 32;
    din78_WIDTH       :integer := 32;
    din79_WIDTH       :integer := 32;
    din80_WIDTH       :integer := 32;
    din81_WIDTH       :integer := 32;
    din82_WIDTH       :integer := 32;
    din83_WIDTH       :integer := 32;
    din84_WIDTH       :integer := 32;
    din85_WIDTH       :integer := 32;
    din86_WIDTH       :integer := 32;
    din87_WIDTH       :integer := 32;
    din88_WIDTH       :integer := 32;
    din89_WIDTH       :integer := 32;
    din90_WIDTH       :integer := 32;
    din91_WIDTH       :integer := 32;
    din92_WIDTH       :integer := 32;
    din93_WIDTH       :integer := 32;
    din94_WIDTH       :integer := 32;
    din95_WIDTH       :integer := 32;
    din96_WIDTH       :integer := 32;
    din97_WIDTH       :integer := 32;
    din98_WIDTH       :integer := 32;
    din99_WIDTH       :integer := 32;
    din100_WIDTH       :integer := 32;
    din101_WIDTH       :integer := 32;
    din102_WIDTH       :integer := 32;
    din103_WIDTH       :integer := 32;
    din104_WIDTH       :integer := 32;
    din105_WIDTH       :integer := 32;
    din106_WIDTH       :integer := 32;
    din107_WIDTH       :integer := 32;
    din108_WIDTH       :integer := 32;
    din109_WIDTH       :integer := 32;
    din110_WIDTH       :integer := 32;
    din111_WIDTH       :integer := 32;
    din112_WIDTH       :integer := 32;
    din113_WIDTH       :integer := 32;
    din114_WIDTH       :integer := 32;
    din115_WIDTH       :integer := 32;
    din116_WIDTH       :integer := 32;
    din117_WIDTH       :integer := 32;
    din118_WIDTH       :integer := 32;
    din119_WIDTH       :integer := 32;
    din120_WIDTH       :integer := 32;
    din121_WIDTH       :integer := 32;
    din122_WIDTH       :integer := 32;
    din123_WIDTH       :integer := 32;
    din124_WIDTH       :integer := 32;
    din125_WIDTH       :integer := 32;
    din126_WIDTH       :integer := 32;
    din127_WIDTH       :integer := 32;
    din128_WIDTH       :integer := 32;
    din129_WIDTH       :integer := 32;
    din130_WIDTH       :integer := 32;
    din131_WIDTH       :integer := 32;
    din132_WIDTH       :integer := 32;
    din133_WIDTH       :integer := 32;
    din134_WIDTH       :integer := 32;
    din135_WIDTH       :integer := 32;
    din136_WIDTH       :integer := 32;
    din137_WIDTH       :integer := 32;
    din138_WIDTH       :integer := 32;
    din139_WIDTH       :integer := 32;
    din140_WIDTH       :integer := 32;
    din141_WIDTH       :integer := 32;
    din142_WIDTH       :integer := 32;
    din143_WIDTH       :integer := 32;
    din144_WIDTH       :integer := 32;
    din145_WIDTH       :integer := 32;
    din146_WIDTH       :integer := 32;
    din147_WIDTH       :integer := 32;
    din148_WIDTH       :integer := 32;
    din149_WIDTH       :integer := 32;
    din150_WIDTH       :integer := 32;
    din151_WIDTH       :integer := 32;
    din152_WIDTH       :integer := 32;
    din153_WIDTH       :integer := 32;
    din154_WIDTH       :integer := 32;
    din155_WIDTH       :integer := 32;
    din156_WIDTH       :integer := 32;
    din157_WIDTH       :integer := 32;
    din158_WIDTH       :integer := 32;
    din159_WIDTH       :integer := 32;
    din160_WIDTH       :integer := 32;
    din161_WIDTH       :integer := 32;
    din162_WIDTH       :integer := 32;
    din163_WIDTH       :integer := 32;
    din164_WIDTH       :integer := 32;
    din165_WIDTH       :integer := 32;
    din166_WIDTH       :integer := 32;
    din167_WIDTH       :integer := 32;
    din168_WIDTH       :integer := 32;
    din169_WIDTH       :integer := 32;
    din170_WIDTH       :integer := 32;
    din171_WIDTH       :integer := 32;
    din172_WIDTH       :integer := 32;
    din173_WIDTH       :integer := 32;
    din174_WIDTH       :integer := 32;
    din175_WIDTH       :integer := 32;
    din176_WIDTH       :integer := 32;
    din177_WIDTH       :integer := 32;
    din178_WIDTH       :integer := 32;
    din179_WIDTH       :integer := 32;
    din180_WIDTH       :integer := 32;
    din181_WIDTH       :integer := 32;
    din182_WIDTH       :integer := 32;
    din183_WIDTH       :integer := 32;
    din184_WIDTH       :integer := 32;
    din185_WIDTH       :integer := 32;
    din186_WIDTH       :integer := 32;
    din187_WIDTH       :integer := 32;
    din188_WIDTH       :integer := 32;
    din189_WIDTH       :integer := 32;
    din190_WIDTH       :integer := 32;
    din191_WIDTH       :integer := 32;
    din192_WIDTH       :integer := 32;
    din193_WIDTH       :integer := 32;
    din194_WIDTH       :integer := 32;
    din195_WIDTH       :integer := 32;
    din196_WIDTH       :integer := 32;
    din197_WIDTH       :integer := 32;
    din198_WIDTH       :integer := 32;
    din199_WIDTH       :integer := 32;
    din200_WIDTH       :integer := 32;
    din201_WIDTH       :integer := 32;
    din202_WIDTH       :integer := 32;
    din203_WIDTH       :integer := 32;
    din204_WIDTH       :integer := 32;
    din205_WIDTH       :integer := 32;
    din206_WIDTH       :integer := 32;
    din207_WIDTH       :integer := 32;
    din208_WIDTH       :integer := 32;
    din209_WIDTH       :integer := 32;
    din210_WIDTH       :integer := 32;
    din211_WIDTH       :integer := 32;
    din212_WIDTH       :integer := 32;
    din213_WIDTH       :integer := 32;
    din214_WIDTH       :integer := 32;
    din215_WIDTH       :integer := 32;
    din216_WIDTH       :integer := 32;
    din217_WIDTH       :integer := 32;
    din218_WIDTH       :integer := 32;
    din219_WIDTH       :integer := 32;
    din220_WIDTH       :integer := 32;
    din221_WIDTH       :integer := 32;
    din222_WIDTH       :integer := 32;
    din223_WIDTH       :integer := 32;
    din224_WIDTH       :integer := 32;
    din225_WIDTH       :integer := 32;
    din226_WIDTH       :integer := 32;
    din227_WIDTH       :integer := 32;
    din228_WIDTH       :integer := 32;
    din229_WIDTH       :integer := 32;
    din230_WIDTH       :integer := 32;
    din231_WIDTH       :integer := 32;
    din232_WIDTH       :integer := 32;
    din233_WIDTH       :integer := 32;
    din234_WIDTH       :integer := 32;
    din235_WIDTH       :integer := 32;
    din236_WIDTH       :integer := 32;
    din237_WIDTH       :integer := 32;
    din238_WIDTH       :integer := 32;
    din239_WIDTH       :integer := 32;
    din240_WIDTH       :integer := 32;
    din241_WIDTH       :integer := 32;
    din242_WIDTH       :integer := 32;
    din243_WIDTH       :integer := 32;
    din244_WIDTH       :integer := 32;
    din245_WIDTH       :integer := 32;
    din246_WIDTH       :integer := 32;
    din247_WIDTH       :integer := 32;
    din248_WIDTH       :integer := 32;
    din249_WIDTH       :integer := 32;
    din250_WIDTH       :integer := 32;
    din251_WIDTH       :integer := 32;
    din252_WIDTH       :integer := 32;
    din253_WIDTH       :integer := 32;
    din254_WIDTH       :integer := 32;
    din255_WIDTH       :integer := 32;
    din256_WIDTH       :integer := 32;
    dout_WIDTH        :integer := 32);
port (
    clk    :in  std_logic;
    reset  :in  std_logic;
    ce     :in  std_logic;
    din0   :in  std_logic_vector(2 downto 0);
    din1   :in  std_logic_vector(2 downto 0);
    din2   :in  std_logic_vector(2 downto 0);
    din3   :in  std_logic_vector(2 downto 0);
    din4   :in  std_logic_vector(2 downto 0);
    din5   :in  std_logic_vector(2 downto 0);
    din6   :in  std_logic_vector(2 downto 0);
    din7   :in  std_logic_vector(2 downto 0);
    din8   :in  std_logic_vector(2 downto 0);
    din9   :in  std_logic_vector(2 downto 0);
    din10   :in  std_logic_vector(2 downto 0);
    din11   :in  std_logic_vector(2 downto 0);
    din12   :in  std_logic_vector(2 downto 0);
    din13   :in  std_logic_vector(2 downto 0);
    din14   :in  std_logic_vector(2 downto 0);
    din15   :in  std_logic_vector(2 downto 0);
    din16   :in  std_logic_vector(2 downto 0);
    din17   :in  std_logic_vector(2 downto 0);
    din18   :in  std_logic_vector(2 downto 0);
    din19   :in  std_logic_vector(2 downto 0);
    din20   :in  std_logic_vector(2 downto 0);
    din21   :in  std_logic_vector(2 downto 0);
    din22   :in  std_logic_vector(2 downto 0);
    din23   :in  std_logic_vector(2 downto 0);
    din24   :in  std_logic_vector(2 downto 0);
    din25   :in  std_logic_vector(2 downto 0);
    din26   :in  std_logic_vector(2 downto 0);
    din27   :in  std_logic_vector(2 downto 0);
    din28   :in  std_logic_vector(2 downto 0);
    din29   :in  std_logic_vector(2 downto 0);
    din30   :in  std_logic_vector(2 downto 0);
    din31   :in  std_logic_vector(2 downto 0);
    din32   :in  std_logic_vector(2 downto 0);
    din33   :in  std_logic_vector(2 downto 0);
    din34   :in  std_logic_vector(2 downto 0);
    din35   :in  std_logic_vector(2 downto 0);
    din36   :in  std_logic_vector(2 downto 0);
    din37   :in  std_logic_vector(2 downto 0);
    din38   :in  std_logic_vector(2 downto 0);
    din39   :in  std_logic_vector(2 downto 0);
    din40   :in  std_logic_vector(2 downto 0);
    din41   :in  std_logic_vector(2 downto 0);
    din42   :in  std_logic_vector(2 downto 0);
    din43   :in  std_logic_vector(2 downto 0);
    din44   :in  std_logic_vector(2 downto 0);
    din45   :in  std_logic_vector(2 downto 0);
    din46   :in  std_logic_vector(2 downto 0);
    din47   :in  std_logic_vector(2 downto 0);
    din48   :in  std_logic_vector(2 downto 0);
    din49   :in  std_logic_vector(2 downto 0);
    din50   :in  std_logic_vector(2 downto 0);
    din51   :in  std_logic_vector(2 downto 0);
    din52   :in  std_logic_vector(2 downto 0);
    din53   :in  std_logic_vector(2 downto 0);
    din54   :in  std_logic_vector(2 downto 0);
    din55   :in  std_logic_vector(2 downto 0);
    din56   :in  std_logic_vector(2 downto 0);
    din57   :in  std_logic_vector(2 downto 0);
    din58   :in  std_logic_vector(2 downto 0);
    din59   :in  std_logic_vector(2 downto 0);
    din60   :in  std_logic_vector(2 downto 0);
    din61   :in  std_logic_vector(2 downto 0);
    din62   :in  std_logic_vector(2 downto 0);
    din63   :in  std_logic_vector(2 downto 0);
    din64   :in  std_logic_vector(2 downto 0);
    din65   :in  std_logic_vector(2 downto 0);
    din66   :in  std_logic_vector(2 downto 0);
    din67   :in  std_logic_vector(2 downto 0);
    din68   :in  std_logic_vector(2 downto 0);
    din69   :in  std_logic_vector(2 downto 0);
    din70   :in  std_logic_vector(2 downto 0);
    din71   :in  std_logic_vector(2 downto 0);
    din72   :in  std_logic_vector(2 downto 0);
    din73   :in  std_logic_vector(2 downto 0);
    din74   :in  std_logic_vector(2 downto 0);
    din75   :in  std_logic_vector(2 downto 0);
    din76   :in  std_logic_vector(2 downto 0);
    din77   :in  std_logic_vector(2 downto 0);
    din78   :in  std_logic_vector(2 downto 0);
    din79   :in  std_logic_vector(2 downto 0);
    din80   :in  std_logic_vector(2 downto 0);
    din81   :in  std_logic_vector(2 downto 0);
    din82   :in  std_logic_vector(2 downto 0);
    din83   :in  std_logic_vector(2 downto 0);
    din84   :in  std_logic_vector(2 downto 0);
    din85   :in  std_logic_vector(2 downto 0);
    din86   :in  std_logic_vector(2 downto 0);
    din87   :in  std_logic_vector(2 downto 0);
    din88   :in  std_logic_vector(2 downto 0);
    din89   :in  std_logic_vector(2 downto 0);
    din90   :in  std_logic_vector(2 downto 0);
    din91   :in  std_logic_vector(2 downto 0);
    din92   :in  std_logic_vector(2 downto 0);
    din93   :in  std_logic_vector(2 downto 0);
    din94   :in  std_logic_vector(2 downto 0);
    din95   :in  std_logic_vector(2 downto 0);
    din96   :in  std_logic_vector(2 downto 0);
    din97   :in  std_logic_vector(2 downto 0);
    din98   :in  std_logic_vector(2 downto 0);
    din99   :in  std_logic_vector(2 downto 0);
    din100   :in  std_logic_vector(2 downto 0);
    din101   :in  std_logic_vector(2 downto 0);
    din102   :in  std_logic_vector(2 downto 0);
    din103   :in  std_logic_vector(2 downto 0);
    din104   :in  std_logic_vector(2 downto 0);
    din105   :in  std_logic_vector(2 downto 0);
    din106   :in  std_logic_vector(2 downto 0);
    din107   :in  std_logic_vector(2 downto 0);
    din108   :in  std_logic_vector(2 downto 0);
    din109   :in  std_logic_vector(2 downto 0);
    din110   :in  std_logic_vector(2 downto 0);
    din111   :in  std_logic_vector(2 downto 0);
    din112   :in  std_logic_vector(2 downto 0);
    din113   :in  std_logic_vector(2 downto 0);
    din114   :in  std_logic_vector(2 downto 0);
    din115   :in  std_logic_vector(2 downto 0);
    din116   :in  std_logic_vector(2 downto 0);
    din117   :in  std_logic_vector(2 downto 0);
    din118   :in  std_logic_vector(2 downto 0);
    din119   :in  std_logic_vector(2 downto 0);
    din120   :in  std_logic_vector(2 downto 0);
    din121   :in  std_logic_vector(2 downto 0);
    din122   :in  std_logic_vector(2 downto 0);
    din123   :in  std_logic_vector(2 downto 0);
    din124   :in  std_logic_vector(2 downto 0);
    din125   :in  std_logic_vector(2 downto 0);
    din126   :in  std_logic_vector(2 downto 0);
    din127   :in  std_logic_vector(2 downto 0);
    din128   :in  std_logic_vector(2 downto 0);
    din129   :in  std_logic_vector(2 downto 0);
    din130   :in  std_logic_vector(2 downto 0);
    din131   :in  std_logic_vector(2 downto 0);
    din132   :in  std_logic_vector(2 downto 0);
    din133   :in  std_logic_vector(2 downto 0);
    din134   :in  std_logic_vector(2 downto 0);
    din135   :in  std_logic_vector(2 downto 0);
    din136   :in  std_logic_vector(2 downto 0);
    din137   :in  std_logic_vector(2 downto 0);
    din138   :in  std_logic_vector(2 downto 0);
    din139   :in  std_logic_vector(2 downto 0);
    din140   :in  std_logic_vector(2 downto 0);
    din141   :in  std_logic_vector(2 downto 0);
    din142   :in  std_logic_vector(2 downto 0);
    din143   :in  std_logic_vector(2 downto 0);
    din144   :in  std_logic_vector(2 downto 0);
    din145   :in  std_logic_vector(2 downto 0);
    din146   :in  std_logic_vector(2 downto 0);
    din147   :in  std_logic_vector(2 downto 0);
    din148   :in  std_logic_vector(2 downto 0);
    din149   :in  std_logic_vector(2 downto 0);
    din150   :in  std_logic_vector(2 downto 0);
    din151   :in  std_logic_vector(2 downto 0);
    din152   :in  std_logic_vector(2 downto 0);
    din153   :in  std_logic_vector(2 downto 0);
    din154   :in  std_logic_vector(2 downto 0);
    din155   :in  std_logic_vector(2 downto 0);
    din156   :in  std_logic_vector(2 downto 0);
    din157   :in  std_logic_vector(2 downto 0);
    din158   :in  std_logic_vector(2 downto 0);
    din159   :in  std_logic_vector(2 downto 0);
    din160   :in  std_logic_vector(2 downto 0);
    din161   :in  std_logic_vector(2 downto 0);
    din162   :in  std_logic_vector(2 downto 0);
    din163   :in  std_logic_vector(2 downto 0);
    din164   :in  std_logic_vector(2 downto 0);
    din165   :in  std_logic_vector(2 downto 0);
    din166   :in  std_logic_vector(2 downto 0);
    din167   :in  std_logic_vector(2 downto 0);
    din168   :in  std_logic_vector(2 downto 0);
    din169   :in  std_logic_vector(2 downto 0);
    din170   :in  std_logic_vector(2 downto 0);
    din171   :in  std_logic_vector(2 downto 0);
    din172   :in  std_logic_vector(2 downto 0);
    din173   :in  std_logic_vector(2 downto 0);
    din174   :in  std_logic_vector(2 downto 0);
    din175   :in  std_logic_vector(2 downto 0);
    din176   :in  std_logic_vector(2 downto 0);
    din177   :in  std_logic_vector(2 downto 0);
    din178   :in  std_logic_vector(2 downto 0);
    din179   :in  std_logic_vector(2 downto 0);
    din180   :in  std_logic_vector(2 downto 0);
    din181   :in  std_logic_vector(2 downto 0);
    din182   :in  std_logic_vector(2 downto 0);
    din183   :in  std_logic_vector(2 downto 0);
    din184   :in  std_logic_vector(2 downto 0);
    din185   :in  std_logic_vector(2 downto 0);
    din186   :in  std_logic_vector(2 downto 0);
    din187   :in  std_logic_vector(2 downto 0);
    din188   :in  std_logic_vector(2 downto 0);
    din189   :in  std_logic_vector(2 downto 0);
    din190   :in  std_logic_vector(2 downto 0);
    din191   :in  std_logic_vector(2 downto 0);
    din192   :in  std_logic_vector(2 downto 0);
    din193   :in  std_logic_vector(2 downto 0);
    din194   :in  std_logic_vector(2 downto 0);
    din195   :in  std_logic_vector(2 downto 0);
    din196   :in  std_logic_vector(2 downto 0);
    din197   :in  std_logic_vector(2 downto 0);
    din198   :in  std_logic_vector(2 downto 0);
    din199   :in  std_logic_vector(2 downto 0);
    din200   :in  std_logic_vector(2 downto 0);
    din201   :in  std_logic_vector(2 downto 0);
    din202   :in  std_logic_vector(2 downto 0);
    din203   :in  std_logic_vector(2 downto 0);
    din204   :in  std_logic_vector(2 downto 0);
    din205   :in  std_logic_vector(2 downto 0);
    din206   :in  std_logic_vector(2 downto 0);
    din207   :in  std_logic_vector(2 downto 0);
    din208   :in  std_logic_vector(2 downto 0);
    din209   :in  std_logic_vector(2 downto 0);
    din210   :in  std_logic_vector(2 downto 0);
    din211   :in  std_logic_vector(2 downto 0);
    din212   :in  std_logic_vector(2 downto 0);
    din213   :in  std_logic_vector(2 downto 0);
    din214   :in  std_logic_vector(2 downto 0);
    din215   :in  std_logic_vector(2 downto 0);
    din216   :in  std_logic_vector(2 downto 0);
    din217   :in  std_logic_vector(2 downto 0);
    din218   :in  std_logic_vector(2 downto 0);
    din219   :in  std_logic_vector(2 downto 0);
    din220   :in  std_logic_vector(2 downto 0);
    din221   :in  std_logic_vector(2 downto 0);
    din222   :in  std_logic_vector(2 downto 0);
    din223   :in  std_logic_vector(2 downto 0);
    din224   :in  std_logic_vector(2 downto 0);
    din225   :in  std_logic_vector(2 downto 0);
    din226   :in  std_logic_vector(2 downto 0);
    din227   :in  std_logic_vector(2 downto 0);
    din228   :in  std_logic_vector(2 downto 0);
    din229   :in  std_logic_vector(2 downto 0);
    din230   :in  std_logic_vector(2 downto 0);
    din231   :in  std_logic_vector(2 downto 0);
    din232   :in  std_logic_vector(2 downto 0);
    din233   :in  std_logic_vector(2 downto 0);
    din234   :in  std_logic_vector(2 downto 0);
    din235   :in  std_logic_vector(2 downto 0);
    din236   :in  std_logic_vector(2 downto 0);
    din237   :in  std_logic_vector(2 downto 0);
    din238   :in  std_logic_vector(2 downto 0);
    din239   :in  std_logic_vector(2 downto 0);
    din240   :in  std_logic_vector(2 downto 0);
    din241   :in  std_logic_vector(2 downto 0);
    din242   :in  std_logic_vector(2 downto 0);
    din243   :in  std_logic_vector(2 downto 0);
    din244   :in  std_logic_vector(2 downto 0);
    din245   :in  std_logic_vector(2 downto 0);
    din246   :in  std_logic_vector(2 downto 0);
    din247   :in  std_logic_vector(2 downto 0);
    din248   :in  std_logic_vector(2 downto 0);
    din249   :in  std_logic_vector(2 downto 0);
    din250   :in  std_logic_vector(2 downto 0);
    din251   :in  std_logic_vector(2 downto 0);
    din252   :in  std_logic_vector(2 downto 0);
    din253   :in  std_logic_vector(2 downto 0);
    din254   :in  std_logic_vector(2 downto 0);
    din255   :in  std_logic_vector(2 downto 0);
    din256   :in  std_logic_vector(7 downto 0);
    dout     :out std_logic_vector(2 downto 0));
end entity;

architecture rtl of byte_count_mux_2568_3_2_1 is
    -- puts internal signals
    signal sel    : std_logic_vector(7 downto 0);
    -- level 1 signals
    signal mux_1_0    : std_logic_vector(2 downto 0);
    signal mux_1_1    : std_logic_vector(2 downto 0);
    signal mux_1_2    : std_logic_vector(2 downto 0);
    signal mux_1_3    : std_logic_vector(2 downto 0);
    signal mux_1_4    : std_logic_vector(2 downto 0);
    signal mux_1_5    : std_logic_vector(2 downto 0);
    signal mux_1_6    : std_logic_vector(2 downto 0);
    signal mux_1_7    : std_logic_vector(2 downto 0);
    signal mux_1_8    : std_logic_vector(2 downto 0);
    signal mux_1_9    : std_logic_vector(2 downto 0);
    signal mux_1_10    : std_logic_vector(2 downto 0);
    signal mux_1_11    : std_logic_vector(2 downto 0);
    signal mux_1_12    : std_logic_vector(2 downto 0);
    signal mux_1_13    : std_logic_vector(2 downto 0);
    signal mux_1_14    : std_logic_vector(2 downto 0);
    signal mux_1_15    : std_logic_vector(2 downto 0);
    signal mux_1_16    : std_logic_vector(2 downto 0);
    signal mux_1_17    : std_logic_vector(2 downto 0);
    signal mux_1_18    : std_logic_vector(2 downto 0);
    signal mux_1_19    : std_logic_vector(2 downto 0);
    signal mux_1_20    : std_logic_vector(2 downto 0);
    signal mux_1_21    : std_logic_vector(2 downto 0);
    signal mux_1_22    : std_logic_vector(2 downto 0);
    signal mux_1_23    : std_logic_vector(2 downto 0);
    signal mux_1_24    : std_logic_vector(2 downto 0);
    signal mux_1_25    : std_logic_vector(2 downto 0);
    signal mux_1_26    : std_logic_vector(2 downto 0);
    signal mux_1_27    : std_logic_vector(2 downto 0);
    signal mux_1_28    : std_logic_vector(2 downto 0);
    signal mux_1_29    : std_logic_vector(2 downto 0);
    signal mux_1_30    : std_logic_vector(2 downto 0);
    signal mux_1_31    : std_logic_vector(2 downto 0);
    signal mux_1_32    : std_logic_vector(2 downto 0);
    signal mux_1_33    : std_logic_vector(2 downto 0);
    signal mux_1_34    : std_logic_vector(2 downto 0);
    signal mux_1_35    : std_logic_vector(2 downto 0);
    signal mux_1_36    : std_logic_vector(2 downto 0);
    signal mux_1_37    : std_logic_vector(2 downto 0);
    signal mux_1_38    : std_logic_vector(2 downto 0);
    signal mux_1_39    : std_logic_vector(2 downto 0);
    signal mux_1_40    : std_logic_vector(2 downto 0);
    signal mux_1_41    : std_logic_vector(2 downto 0);
    signal mux_1_42    : std_logic_vector(2 downto 0);
    signal mux_1_43    : std_logic_vector(2 downto 0);
    signal mux_1_44    : std_logic_vector(2 downto 0);
    signal mux_1_45    : std_logic_vector(2 downto 0);
    signal mux_1_46    : std_logic_vector(2 downto 0);
    signal mux_1_47    : std_logic_vector(2 downto 0);
    signal mux_1_48    : std_logic_vector(2 downto 0);
    signal mux_1_49    : std_logic_vector(2 downto 0);
    signal mux_1_50    : std_logic_vector(2 downto 0);
    signal mux_1_51    : std_logic_vector(2 downto 0);
    signal mux_1_52    : std_logic_vector(2 downto 0);
    signal mux_1_53    : std_logic_vector(2 downto 0);
    signal mux_1_54    : std_logic_vector(2 downto 0);
    signal mux_1_55    : std_logic_vector(2 downto 0);
    signal mux_1_56    : std_logic_vector(2 downto 0);
    signal mux_1_57    : std_logic_vector(2 downto 0);
    signal mux_1_58    : std_logic_vector(2 downto 0);
    signal mux_1_59    : std_logic_vector(2 downto 0);
    signal mux_1_60    : std_logic_vector(2 downto 0);
    signal mux_1_61    : std_logic_vector(2 downto 0);
    signal mux_1_62    : std_logic_vector(2 downto 0);
    signal mux_1_63    : std_logic_vector(2 downto 0);
    signal mux_1_64    : std_logic_vector(2 downto 0);
    signal mux_1_65    : std_logic_vector(2 downto 0);
    signal mux_1_66    : std_logic_vector(2 downto 0);
    signal mux_1_67    : std_logic_vector(2 downto 0);
    signal mux_1_68    : std_logic_vector(2 downto 0);
    signal mux_1_69    : std_logic_vector(2 downto 0);
    signal mux_1_70    : std_logic_vector(2 downto 0);
    signal mux_1_71    : std_logic_vector(2 downto 0);
    signal mux_1_72    : std_logic_vector(2 downto 0);
    signal mux_1_73    : std_logic_vector(2 downto 0);
    signal mux_1_74    : std_logic_vector(2 downto 0);
    signal mux_1_75    : std_logic_vector(2 downto 0);
    signal mux_1_76    : std_logic_vector(2 downto 0);
    signal mux_1_77    : std_logic_vector(2 downto 0);
    signal mux_1_78    : std_logic_vector(2 downto 0);
    signal mux_1_79    : std_logic_vector(2 downto 0);
    signal mux_1_80    : std_logic_vector(2 downto 0);
    signal mux_1_81    : std_logic_vector(2 downto 0);
    signal mux_1_82    : std_logic_vector(2 downto 0);
    signal mux_1_83    : std_logic_vector(2 downto 0);
    signal mux_1_84    : std_logic_vector(2 downto 0);
    signal mux_1_85    : std_logic_vector(2 downto 0);
    signal mux_1_86    : std_logic_vector(2 downto 0);
    signal mux_1_87    : std_logic_vector(2 downto 0);
    signal mux_1_88    : std_logic_vector(2 downto 0);
    signal mux_1_89    : std_logic_vector(2 downto 0);
    signal mux_1_90    : std_logic_vector(2 downto 0);
    signal mux_1_91    : std_logic_vector(2 downto 0);
    signal mux_1_92    : std_logic_vector(2 downto 0);
    signal mux_1_93    : std_logic_vector(2 downto 0);
    signal mux_1_94    : std_logic_vector(2 downto 0);
    signal mux_1_95    : std_logic_vector(2 downto 0);
    signal mux_1_96    : std_logic_vector(2 downto 0);
    signal mux_1_97    : std_logic_vector(2 downto 0);
    signal mux_1_98    : std_logic_vector(2 downto 0);
    signal mux_1_99    : std_logic_vector(2 downto 0);
    signal mux_1_100    : std_logic_vector(2 downto 0);
    signal mux_1_101    : std_logic_vector(2 downto 0);
    signal mux_1_102    : std_logic_vector(2 downto 0);
    signal mux_1_103    : std_logic_vector(2 downto 0);
    signal mux_1_104    : std_logic_vector(2 downto 0);
    signal mux_1_105    : std_logic_vector(2 downto 0);
    signal mux_1_106    : std_logic_vector(2 downto 0);
    signal mux_1_107    : std_logic_vector(2 downto 0);
    signal mux_1_108    : std_logic_vector(2 downto 0);
    signal mux_1_109    : std_logic_vector(2 downto 0);
    signal mux_1_110    : std_logic_vector(2 downto 0);
    signal mux_1_111    : std_logic_vector(2 downto 0);
    signal mux_1_112    : std_logic_vector(2 downto 0);
    signal mux_1_113    : std_logic_vector(2 downto 0);
    signal mux_1_114    : std_logic_vector(2 downto 0);
    signal mux_1_115    : std_logic_vector(2 downto 0);
    signal mux_1_116    : std_logic_vector(2 downto 0);
    signal mux_1_117    : std_logic_vector(2 downto 0);
    signal mux_1_118    : std_logic_vector(2 downto 0);
    signal mux_1_119    : std_logic_vector(2 downto 0);
    signal mux_1_120    : std_logic_vector(2 downto 0);
    signal mux_1_121    : std_logic_vector(2 downto 0);
    signal mux_1_122    : std_logic_vector(2 downto 0);
    signal mux_1_123    : std_logic_vector(2 downto 0);
    signal mux_1_124    : std_logic_vector(2 downto 0);
    signal mux_1_125    : std_logic_vector(2 downto 0);
    signal mux_1_126    : std_logic_vector(2 downto 0);
    signal mux_1_127    : std_logic_vector(2 downto 0);
    -- level 2 signals
    signal mux_2_0    : std_logic_vector(2 downto 0);
    signal mux_2_1    : std_logic_vector(2 downto 0);
    signal mux_2_2    : std_logic_vector(2 downto 0);
    signal mux_2_3    : std_logic_vector(2 downto 0);
    signal mux_2_4    : std_logic_vector(2 downto 0);
    signal mux_2_5    : std_logic_vector(2 downto 0);
    signal mux_2_6    : std_logic_vector(2 downto 0);
    signal mux_2_7    : std_logic_vector(2 downto 0);
    signal mux_2_8    : std_logic_vector(2 downto 0);
    signal mux_2_9    : std_logic_vector(2 downto 0);
    signal mux_2_10    : std_logic_vector(2 downto 0);
    signal mux_2_11    : std_logic_vector(2 downto 0);
    signal mux_2_12    : std_logic_vector(2 downto 0);
    signal mux_2_13    : std_logic_vector(2 downto 0);
    signal mux_2_14    : std_logic_vector(2 downto 0);
    signal mux_2_15    : std_logic_vector(2 downto 0);
    signal mux_2_16    : std_logic_vector(2 downto 0);
    signal mux_2_17    : std_logic_vector(2 downto 0);
    signal mux_2_18    : std_logic_vector(2 downto 0);
    signal mux_2_19    : std_logic_vector(2 downto 0);
    signal mux_2_20    : std_logic_vector(2 downto 0);
    signal mux_2_21    : std_logic_vector(2 downto 0);
    signal mux_2_22    : std_logic_vector(2 downto 0);
    signal mux_2_23    : std_logic_vector(2 downto 0);
    signal mux_2_24    : std_logic_vector(2 downto 0);
    signal mux_2_25    : std_logic_vector(2 downto 0);
    signal mux_2_26    : std_logic_vector(2 downto 0);
    signal mux_2_27    : std_logic_vector(2 downto 0);
    signal mux_2_28    : std_logic_vector(2 downto 0);
    signal mux_2_29    : std_logic_vector(2 downto 0);
    signal mux_2_30    : std_logic_vector(2 downto 0);
    signal mux_2_31    : std_logic_vector(2 downto 0);
    signal mux_2_32    : std_logic_vector(2 downto 0);
    signal mux_2_33    : std_logic_vector(2 downto 0);
    signal mux_2_34    : std_logic_vector(2 downto 0);
    signal mux_2_35    : std_logic_vector(2 downto 0);
    signal mux_2_36    : std_logic_vector(2 downto 0);
    signal mux_2_37    : std_logic_vector(2 downto 0);
    signal mux_2_38    : std_logic_vector(2 downto 0);
    signal mux_2_39    : std_logic_vector(2 downto 0);
    signal mux_2_40    : std_logic_vector(2 downto 0);
    signal mux_2_41    : std_logic_vector(2 downto 0);
    signal mux_2_42    : std_logic_vector(2 downto 0);
    signal mux_2_43    : std_logic_vector(2 downto 0);
    signal mux_2_44    : std_logic_vector(2 downto 0);
    signal mux_2_45    : std_logic_vector(2 downto 0);
    signal mux_2_46    : std_logic_vector(2 downto 0);
    signal mux_2_47    : std_logic_vector(2 downto 0);
    signal mux_2_48    : std_logic_vector(2 downto 0);
    signal mux_2_49    : std_logic_vector(2 downto 0);
    signal mux_2_50    : std_logic_vector(2 downto 0);
    signal mux_2_51    : std_logic_vector(2 downto 0);
    signal mux_2_52    : std_logic_vector(2 downto 0);
    signal mux_2_53    : std_logic_vector(2 downto 0);
    signal mux_2_54    : std_logic_vector(2 downto 0);
    signal mux_2_55    : std_logic_vector(2 downto 0);
    signal mux_2_56    : std_logic_vector(2 downto 0);
    signal mux_2_57    : std_logic_vector(2 downto 0);
    signal mux_2_58    : std_logic_vector(2 downto 0);
    signal mux_2_59    : std_logic_vector(2 downto 0);
    signal mux_2_60    : std_logic_vector(2 downto 0);
    signal mux_2_61    : std_logic_vector(2 downto 0);
    signal mux_2_62    : std_logic_vector(2 downto 0);
    signal mux_2_63    : std_logic_vector(2 downto 0);
    -- level 3 signals
    signal mux_3_0    : std_logic_vector(2 downto 0);
    signal mux_3_1    : std_logic_vector(2 downto 0);
    signal mux_3_2    : std_logic_vector(2 downto 0);
    signal mux_3_3    : std_logic_vector(2 downto 0);
    signal mux_3_4    : std_logic_vector(2 downto 0);
    signal mux_3_5    : std_logic_vector(2 downto 0);
    signal mux_3_6    : std_logic_vector(2 downto 0);
    signal mux_3_7    : std_logic_vector(2 downto 0);
    signal mux_3_8    : std_logic_vector(2 downto 0);
    signal mux_3_9    : std_logic_vector(2 downto 0);
    signal mux_3_10    : std_logic_vector(2 downto 0);
    signal mux_3_11    : std_logic_vector(2 downto 0);
    signal mux_3_12    : std_logic_vector(2 downto 0);
    signal mux_3_13    : std_logic_vector(2 downto 0);
    signal mux_3_14    : std_logic_vector(2 downto 0);
    signal mux_3_15    : std_logic_vector(2 downto 0);
    signal mux_3_16    : std_logic_vector(2 downto 0);
    signal mux_3_17    : std_logic_vector(2 downto 0);
    signal mux_3_18    : std_logic_vector(2 downto 0);
    signal mux_3_19    : std_logic_vector(2 downto 0);
    signal mux_3_20    : std_logic_vector(2 downto 0);
    signal mux_3_21    : std_logic_vector(2 downto 0);
    signal mux_3_22    : std_logic_vector(2 downto 0);
    signal mux_3_23    : std_logic_vector(2 downto 0);
    signal mux_3_24    : std_logic_vector(2 downto 0);
    signal mux_3_25    : std_logic_vector(2 downto 0);
    signal mux_3_26    : std_logic_vector(2 downto 0);
    signal mux_3_27    : std_logic_vector(2 downto 0);
    signal mux_3_28    : std_logic_vector(2 downto 0);
    signal mux_3_29    : std_logic_vector(2 downto 0);
    signal mux_3_30    : std_logic_vector(2 downto 0);
    signal mux_3_31    : std_logic_vector(2 downto 0);
    -- level 4 signals
    signal mux_4_0_reg    : std_logic_vector(2 downto 0);
    signal mux_4_1_reg    : std_logic_vector(2 downto 0);
    signal mux_4_2_reg    : std_logic_vector(2 downto 0);
    signal mux_4_3_reg    : std_logic_vector(2 downto 0);
    signal mux_4_4_reg    : std_logic_vector(2 downto 0);
    signal mux_4_5_reg    : std_logic_vector(2 downto 0);
    signal mux_4_6_reg    : std_logic_vector(2 downto 0);
    signal mux_4_7_reg    : std_logic_vector(2 downto 0);
    signal mux_4_8_reg    : std_logic_vector(2 downto 0);
    signal mux_4_9_reg    : std_logic_vector(2 downto 0);
    signal mux_4_10_reg    : std_logic_vector(2 downto 0);
    signal mux_4_11_reg    : std_logic_vector(2 downto 0);
    signal mux_4_12_reg    : std_logic_vector(2 downto 0);
    signal mux_4_13_reg    : std_logic_vector(2 downto 0);
    signal mux_4_14_reg    : std_logic_vector(2 downto 0);
    signal mux_4_15_reg    : std_logic_vector(2 downto 0);
    signal sel4   : std_logic_vector(7 downto 4);
    -- level 5 signals
    signal mux_5_0    : std_logic_vector(2 downto 0);
    signal mux_5_1    : std_logic_vector(2 downto 0);
    signal mux_5_2    : std_logic_vector(2 downto 0);
    signal mux_5_3    : std_logic_vector(2 downto 0);
    signal mux_5_4    : std_logic_vector(2 downto 0);
    signal mux_5_5    : std_logic_vector(2 downto 0);
    signal mux_5_6    : std_logic_vector(2 downto 0);
    signal mux_5_7    : std_logic_vector(2 downto 0);
    -- level 6 signals
    signal mux_6_0    : std_logic_vector(2 downto 0);
    signal mux_6_1    : std_logic_vector(2 downto 0);
    signal mux_6_2    : std_logic_vector(2 downto 0);
    signal mux_6_3    : std_logic_vector(2 downto 0);
    -- level 7 signals
    signal mux_7_0    : std_logic_vector(2 downto 0);
    signal mux_7_1    : std_logic_vector(2 downto 0);
    -- level 8 signals
    signal mux_8_0    : std_logic_vector(2 downto 0);
begin

sel <= din256;

-- Generate level 1 logic
mux_1_0 <= din0 when sel(0) = '0' else din1;
mux_1_1 <= din2 when sel(0) = '0' else din3;
mux_1_2 <= din4 when sel(0) = '0' else din5;
mux_1_3 <= din6 when sel(0) = '0' else din7;
mux_1_4 <= din8 when sel(0) = '0' else din9;
mux_1_5 <= din10 when sel(0) = '0' else din11;
mux_1_6 <= din12 when sel(0) = '0' else din13;
mux_1_7 <= din14 when sel(0) = '0' else din15;
mux_1_8 <= din16 when sel(0) = '0' else din17;
mux_1_9 <= din18 when sel(0) = '0' else din19;
mux_1_10 <= din20 when sel(0) = '0' else din21;
mux_1_11 <= din22 when sel(0) = '0' else din23;
mux_1_12 <= din24 when sel(0) = '0' else din25;
mux_1_13 <= din26 when sel(0) = '0' else din27;
mux_1_14 <= din28 when sel(0) = '0' else din29;
mux_1_15 <= din30 when sel(0) = '0' else din31;
mux_1_16 <= din32 when sel(0) = '0' else din33;
mux_1_17 <= din34 when sel(0) = '0' else din35;
mux_1_18 <= din36 when sel(0) = '0' else din37;
mux_1_19 <= din38 when sel(0) = '0' else din39;
mux_1_20 <= din40 when sel(0) = '0' else din41;
mux_1_21 <= din42 when sel(0) = '0' else din43;
mux_1_22 <= din44 when sel(0) = '0' else din45;
mux_1_23 <= din46 when sel(0) = '0' else din47;
mux_1_24 <= din48 when sel(0) = '0' else din49;
mux_1_25 <= din50 when sel(0) = '0' else din51;
mux_1_26 <= din52 when sel(0) = '0' else din53;
mux_1_27 <= din54 when sel(0) = '0' else din55;
mux_1_28 <= din56 when sel(0) = '0' else din57;
mux_1_29 <= din58 when sel(0) = '0' else din59;
mux_1_30 <= din60 when sel(0) = '0' else din61;
mux_1_31 <= din62 when sel(0) = '0' else din63;
mux_1_32 <= din64 when sel(0) = '0' else din65;
mux_1_33 <= din66 when sel(0) = '0' else din67;
mux_1_34 <= din68 when sel(0) = '0' else din69;
mux_1_35 <= din70 when sel(0) = '0' else din71;
mux_1_36 <= din72 when sel(0) = '0' else din73;
mux_1_37 <= din74 when sel(0) = '0' else din75;
mux_1_38 <= din76 when sel(0) = '0' else din77;
mux_1_39 <= din78 when sel(0) = '0' else din79;
mux_1_40 <= din80 when sel(0) = '0' else din81;
mux_1_41 <= din82 when sel(0) = '0' else din83;
mux_1_42 <= din84 when sel(0) = '0' else din85;
mux_1_43 <= din86 when sel(0) = '0' else din87;
mux_1_44 <= din88 when sel(0) = '0' else din89;
mux_1_45 <= din90 when sel(0) = '0' else din91;
mux_1_46 <= din92 when sel(0) = '0' else din93;
mux_1_47 <= din94 when sel(0) = '0' else din95;
mux_1_48 <= din96 when sel(0) = '0' else din97;
mux_1_49 <= din98 when sel(0) = '0' else din99;
mux_1_50 <= din100 when sel(0) = '0' else din101;
mux_1_51 <= din102 when sel(0) = '0' else din103;
mux_1_52 <= din104 when sel(0) = '0' else din105;
mux_1_53 <= din106 when sel(0) = '0' else din107;
mux_1_54 <= din108 when sel(0) = '0' else din109;
mux_1_55 <= din110 when sel(0) = '0' else din111;
mux_1_56 <= din112 when sel(0) = '0' else din113;
mux_1_57 <= din114 when sel(0) = '0' else din115;
mux_1_58 <= din116 when sel(0) = '0' else din117;
mux_1_59 <= din118 when sel(0) = '0' else din119;
mux_1_60 <= din120 when sel(0) = '0' else din121;
mux_1_61 <= din122 when sel(0) = '0' else din123;
mux_1_62 <= din124 when sel(0) = '0' else din125;
mux_1_63 <= din126 when sel(0) = '0' else din127;
mux_1_64 <= din128 when sel(0) = '0' else din129;
mux_1_65 <= din130 when sel(0) = '0' else din131;
mux_1_66 <= din132 when sel(0) = '0' else din133;
mux_1_67 <= din134 when sel(0) = '0' else din135;
mux_1_68 <= din136 when sel(0) = '0' else din137;
mux_1_69 <= din138 when sel(0) = '0' else din139;
mux_1_70 <= din140 when sel(0) = '0' else din141;
mux_1_71 <= din142 when sel(0) = '0' else din143;
mux_1_72 <= din144 when sel(0) = '0' else din145;
mux_1_73 <= din146 when sel(0) = '0' else din147;
mux_1_74 <= din148 when sel(0) = '0' else din149;
mux_1_75 <= din150 when sel(0) = '0' else din151;
mux_1_76 <= din152 when sel(0) = '0' else din153;
mux_1_77 <= din154 when sel(0) = '0' else din155;
mux_1_78 <= din156 when sel(0) = '0' else din157;
mux_1_79 <= din158 when sel(0) = '0' else din159;
mux_1_80 <= din160 when sel(0) = '0' else din161;
mux_1_81 <= din162 when sel(0) = '0' else din163;
mux_1_82 <= din164 when sel(0) = '0' else din165;
mux_1_83 <= din166 when sel(0) = '0' else din167;
mux_1_84 <= din168 when sel(0) = '0' else din169;
mux_1_85 <= din170 when sel(0) = '0' else din171;
mux_1_86 <= din172 when sel(0) = '0' else din173;
mux_1_87 <= din174 when sel(0) = '0' else din175;
mux_1_88 <= din176 when sel(0) = '0' else din177;
mux_1_89 <= din178 when sel(0) = '0' else din179;
mux_1_90 <= din180 when sel(0) = '0' else din181;
mux_1_91 <= din182 when sel(0) = '0' else din183;
mux_1_92 <= din184 when sel(0) = '0' else din185;
mux_1_93 <= din186 when sel(0) = '0' else din187;
mux_1_94 <= din188 when sel(0) = '0' else din189;
mux_1_95 <= din190 when sel(0) = '0' else din191;
mux_1_96 <= din192 when sel(0) = '0' else din193;
mux_1_97 <= din194 when sel(0) = '0' else din195;
mux_1_98 <= din196 when sel(0) = '0' else din197;
mux_1_99 <= din198 when sel(0) = '0' else din199;
mux_1_100 <= din200 when sel(0) = '0' else din201;
mux_1_101 <= din202 when sel(0) = '0' else din203;
mux_1_102 <= din204 when sel(0) = '0' else din205;
mux_1_103 <= din206 when sel(0) = '0' else din207;
mux_1_104 <= din208 when sel(0) = '0' else din209;
mux_1_105 <= din210 when sel(0) = '0' else din211;
mux_1_106 <= din212 when sel(0) = '0' else din213;
mux_1_107 <= din214 when sel(0) = '0' else din215;
mux_1_108 <= din216 when sel(0) = '0' else din217;
mux_1_109 <= din218 when sel(0) = '0' else din219;
mux_1_110 <= din220 when sel(0) = '0' else din221;
mux_1_111 <= din222 when sel(0) = '0' else din223;
mux_1_112 <= din224 when sel(0) = '0' else din225;
mux_1_113 <= din226 when sel(0) = '0' else din227;
mux_1_114 <= din228 when sel(0) = '0' else din229;
mux_1_115 <= din230 when sel(0) = '0' else din231;
mux_1_116 <= din232 when sel(0) = '0' else din233;
mux_1_117 <= din234 when sel(0) = '0' else din235;
mux_1_118 <= din236 when sel(0) = '0' else din237;
mux_1_119 <= din238 when sel(0) = '0' else din239;
mux_1_120 <= din240 when sel(0) = '0' else din241;
mux_1_121 <= din242 when sel(0) = '0' else din243;
mux_1_122 <= din244 when sel(0) = '0' else din245;
mux_1_123 <= din246 when sel(0) = '0' else din247;
mux_1_124 <= din248 when sel(0) = '0' else din249;
mux_1_125 <= din250 when sel(0) = '0' else din251;
mux_1_126 <= din252 when sel(0) = '0' else din253;
mux_1_127 <= din254 when sel(0) = '0' else din255;

-- Generate level 2 logic
mux_2_0 <= mux_1_0 when sel(1) = '0' else mux_1_1;
mux_2_1 <= mux_1_2 when sel(1) = '0' else mux_1_3;
mux_2_2 <= mux_1_4 when sel(1) = '0' else mux_1_5;
mux_2_3 <= mux_1_6 when sel(1) = '0' else mux_1_7;
mux_2_4 <= mux_1_8 when sel(1) = '0' else mux_1_9;
mux_2_5 <= mux_1_10 when sel(1) = '0' else mux_1_11;
mux_2_6 <= mux_1_12 when sel(1) = '0' else mux_1_13;
mux_2_7 <= mux_1_14 when sel(1) = '0' else mux_1_15;
mux_2_8 <= mux_1_16 when sel(1) = '0' else mux_1_17;
mux_2_9 <= mux_1_18 when sel(1) = '0' else mux_1_19;
mux_2_10 <= mux_1_20 when sel(1) = '0' else mux_1_21;
mux_2_11 <= mux_1_22 when sel(1) = '0' else mux_1_23;
mux_2_12 <= mux_1_24 when sel(1) = '0' else mux_1_25;
mux_2_13 <= mux_1_26 when sel(1) = '0' else mux_1_27;
mux_2_14 <= mux_1_28 when sel(1) = '0' else mux_1_29;
mux_2_15 <= mux_1_30 when sel(1) = '0' else mux_1_31;
mux_2_16 <= mux_1_32 when sel(1) = '0' else mux_1_33;
mux_2_17 <= mux_1_34 when sel(1) = '0' else mux_1_35;
mux_2_18 <= mux_1_36 when sel(1) = '0' else mux_1_37;
mux_2_19 <= mux_1_38 when sel(1) = '0' else mux_1_39;
mux_2_20 <= mux_1_40 when sel(1) = '0' else mux_1_41;
mux_2_21 <= mux_1_42 when sel(1) = '0' else mux_1_43;
mux_2_22 <= mux_1_44 when sel(1) = '0' else mux_1_45;
mux_2_23 <= mux_1_46 when sel(1) = '0' else mux_1_47;
mux_2_24 <= mux_1_48 when sel(1) = '0' else mux_1_49;
mux_2_25 <= mux_1_50 when sel(1) = '0' else mux_1_51;
mux_2_26 <= mux_1_52 when sel(1) = '0' else mux_1_53;
mux_2_27 <= mux_1_54 when sel(1) = '0' else mux_1_55;
mux_2_28 <= mux_1_56 when sel(1) = '0' else mux_1_57;
mux_2_29 <= mux_1_58 when sel(1) = '0' else mux_1_59;
mux_2_30 <= mux_1_60 when sel(1) = '0' else mux_1_61;
mux_2_31 <= mux_1_62 when sel(1) = '0' else mux_1_63;
mux_2_32 <= mux_1_64 when sel(1) = '0' else mux_1_65;
mux_2_33 <= mux_1_66 when sel(1) = '0' else mux_1_67;
mux_2_34 <= mux_1_68 when sel(1) = '0' else mux_1_69;
mux_2_35 <= mux_1_70 when sel(1) = '0' else mux_1_71;
mux_2_36 <= mux_1_72 when sel(1) = '0' else mux_1_73;
mux_2_37 <= mux_1_74 when sel(1) = '0' else mux_1_75;
mux_2_38 <= mux_1_76 when sel(1) = '0' else mux_1_77;
mux_2_39 <= mux_1_78 when sel(1) = '0' else mux_1_79;
mux_2_40 <= mux_1_80 when sel(1) = '0' else mux_1_81;
mux_2_41 <= mux_1_82 when sel(1) = '0' else mux_1_83;
mux_2_42 <= mux_1_84 when sel(1) = '0' else mux_1_85;
mux_2_43 <= mux_1_86 when sel(1) = '0' else mux_1_87;
mux_2_44 <= mux_1_88 when sel(1) = '0' else mux_1_89;
mux_2_45 <= mux_1_90 when sel(1) = '0' else mux_1_91;
mux_2_46 <= mux_1_92 when sel(1) = '0' else mux_1_93;
mux_2_47 <= mux_1_94 when sel(1) = '0' else mux_1_95;
mux_2_48 <= mux_1_96 when sel(1) = '0' else mux_1_97;
mux_2_49 <= mux_1_98 when sel(1) = '0' else mux_1_99;
mux_2_50 <= mux_1_100 when sel(1) = '0' else mux_1_101;
mux_2_51 <= mux_1_102 when sel(1) = '0' else mux_1_103;
mux_2_52 <= mux_1_104 when sel(1) = '0' else mux_1_105;
mux_2_53 <= mux_1_106 when sel(1) = '0' else mux_1_107;
mux_2_54 <= mux_1_108 when sel(1) = '0' else mux_1_109;
mux_2_55 <= mux_1_110 when sel(1) = '0' else mux_1_111;
mux_2_56 <= mux_1_112 when sel(1) = '0' else mux_1_113;
mux_2_57 <= mux_1_114 when sel(1) = '0' else mux_1_115;
mux_2_58 <= mux_1_116 when sel(1) = '0' else mux_1_117;
mux_2_59 <= mux_1_118 when sel(1) = '0' else mux_1_119;
mux_2_60 <= mux_1_120 when sel(1) = '0' else mux_1_121;
mux_2_61 <= mux_1_122 when sel(1) = '0' else mux_1_123;
mux_2_62 <= mux_1_124 when sel(1) = '0' else mux_1_125;
mux_2_63 <= mux_1_126 when sel(1) = '0' else mux_1_127;

-- Generate level 3 logic
mux_3_0 <= mux_2_0 when sel(2) = '0' else mux_2_1;
mux_3_1 <= mux_2_2 when sel(2) = '0' else mux_2_3;
mux_3_2 <= mux_2_4 when sel(2) = '0' else mux_2_5;
mux_3_3 <= mux_2_6 when sel(2) = '0' else mux_2_7;
mux_3_4 <= mux_2_8 when sel(2) = '0' else mux_2_9;
mux_3_5 <= mux_2_10 when sel(2) = '0' else mux_2_11;
mux_3_6 <= mux_2_12 when sel(2) = '0' else mux_2_13;
mux_3_7 <= mux_2_14 when sel(2) = '0' else mux_2_15;
mux_3_8 <= mux_2_16 when sel(2) = '0' else mux_2_17;
mux_3_9 <= mux_2_18 when sel(2) = '0' else mux_2_19;
mux_3_10 <= mux_2_20 when sel(2) = '0' else mux_2_21;
mux_3_11 <= mux_2_22 when sel(2) = '0' else mux_2_23;
mux_3_12 <= mux_2_24 when sel(2) = '0' else mux_2_25;
mux_3_13 <= mux_2_26 when sel(2) = '0' else mux_2_27;
mux_3_14 <= mux_2_28 when sel(2) = '0' else mux_2_29;
mux_3_15 <= mux_2_30 when sel(2) = '0' else mux_2_31;
mux_3_16 <= mux_2_32 when sel(2) = '0' else mux_2_33;
mux_3_17 <= mux_2_34 when sel(2) = '0' else mux_2_35;
mux_3_18 <= mux_2_36 when sel(2) = '0' else mux_2_37;
mux_3_19 <= mux_2_38 when sel(2) = '0' else mux_2_39;
mux_3_20 <= mux_2_40 when sel(2) = '0' else mux_2_41;
mux_3_21 <= mux_2_42 when sel(2) = '0' else mux_2_43;
mux_3_22 <= mux_2_44 when sel(2) = '0' else mux_2_45;
mux_3_23 <= mux_2_46 when sel(2) = '0' else mux_2_47;
mux_3_24 <= mux_2_48 when sel(2) = '0' else mux_2_49;
mux_3_25 <= mux_2_50 when sel(2) = '0' else mux_2_51;
mux_3_26 <= mux_2_52 when sel(2) = '0' else mux_2_53;
mux_3_27 <= mux_2_54 when sel(2) = '0' else mux_2_55;
mux_3_28 <= mux_2_56 when sel(2) = '0' else mux_2_57;
mux_3_29 <= mux_2_58 when sel(2) = '0' else mux_2_59;
mux_3_30 <= mux_2_60 when sel(2) = '0' else mux_2_61;
mux_3_31 <= mux_2_62 when sel(2) = '0' else mux_2_63;

-- Generate level 4 logic
process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            sel4 <= (others => '0');
        elsif (ce = '1') then
            sel4 <= sel(7 downto 4);
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_0_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_0_reg <= mux_3_0;
            else
                mux_4_0_reg <= mux_3_1;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_1_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_1_reg <= mux_3_2;
            else
                mux_4_1_reg <= mux_3_3;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_2_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_2_reg <= mux_3_4;
            else
                mux_4_2_reg <= mux_3_5;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_3_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_3_reg <= mux_3_6;
            else
                mux_4_3_reg <= mux_3_7;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_4_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_4_reg <= mux_3_8;
            else
                mux_4_4_reg <= mux_3_9;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_5_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_5_reg <= mux_3_10;
            else
                mux_4_5_reg <= mux_3_11;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_6_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_6_reg <= mux_3_12;
            else
                mux_4_6_reg <= mux_3_13;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_7_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_7_reg <= mux_3_14;
            else
                mux_4_7_reg <= mux_3_15;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_8_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_8_reg <= mux_3_16;
            else
                mux_4_8_reg <= mux_3_17;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_9_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_9_reg <= mux_3_18;
            else
                mux_4_9_reg <= mux_3_19;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_10_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_10_reg <= mux_3_20;
            else
                mux_4_10_reg <= mux_3_21;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_11_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_11_reg <= mux_3_22;
            else
                mux_4_11_reg <= mux_3_23;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_12_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_12_reg <= mux_3_24;
            else
                mux_4_12_reg <= mux_3_25;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_13_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_13_reg <= mux_3_26;
            else
                mux_4_13_reg <= mux_3_27;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_14_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_14_reg <= mux_3_28;
            else
                mux_4_14_reg <= mux_3_29;
            end if;
        end if;
    end if;
end process;

process (clk)
begin
    if (clk'event and clk='1') then
        if (reset = '1') then
            mux_4_15_reg <= (others => '0');
        elsif (ce = '1') then
            if (sel(3) = '0') then
                mux_4_15_reg <= mux_3_30;
            else
                mux_4_15_reg <= mux_3_31;
            end if;
        end if;
    end if;
end process;


-- Generate level 5 logic
mux_5_0 <= mux_4_0_reg when sel4(4) = '0' else mux_4_1_reg;
mux_5_1 <= mux_4_2_reg when sel4(4) = '0' else mux_4_3_reg;
mux_5_2 <= mux_4_4_reg when sel4(4) = '0' else mux_4_5_reg;
mux_5_3 <= mux_4_6_reg when sel4(4) = '0' else mux_4_7_reg;
mux_5_4 <= mux_4_8_reg when sel4(4) = '0' else mux_4_9_reg;
mux_5_5 <= mux_4_10_reg when sel4(4) = '0' else mux_4_11_reg;
mux_5_6 <= mux_4_12_reg when sel4(4) = '0' else mux_4_13_reg;
mux_5_7 <= mux_4_14_reg when sel4(4) = '0' else mux_4_15_reg;

-- Generate level 6 logic
mux_6_0 <= mux_5_0 when sel4(5) = '0' else mux_5_1;
mux_6_1 <= mux_5_2 when sel4(5) = '0' else mux_5_3;
mux_6_2 <= mux_5_4 when sel4(5) = '0' else mux_5_5;
mux_6_3 <= mux_5_6 when sel4(5) = '0' else mux_5_7;

-- Generate level 7 logic
mux_7_0 <= mux_6_0 when sel4(6) = '0' else mux_6_1;
mux_7_1 <= mux_6_2 when sel4(6) = '0' else mux_6_3;

-- Generate level 8 logic
mux_8_0 <= mux_7_0 when sel4(7) = '0' else mux_7_1;

-- output logic
dout <= mux_8_0;

end architecture;
