//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Sun Oct  2 12:20:14 2022
//Host        : Omnya running 64-bit major release  (build 9200)
//Command     : generate_target concat_intr_wrapper.bd
//Design      : concat_intr_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module concat_intr_wrapper
   (Intr_in_0,
    Intr_in_1,
    Intr_out);
  input Intr_in_0;
  input Intr_in_1;
  output [1:0]Intr_out;

  wire Intr_in_0;
  wire Intr_in_1;
  wire [1:0]Intr_out;

  concat_intr concat_intr_i
       (.Intr_in_0(Intr_in_0),
        .Intr_in_1(Intr_in_1),
        .Intr_out(Intr_out));
endmodule
