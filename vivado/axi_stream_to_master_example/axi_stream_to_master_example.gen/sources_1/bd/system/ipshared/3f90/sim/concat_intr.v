//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Sun Oct  2 12:20:14 2022
//Host        : Omnya running 64-bit major release  (build 9200)
//Command     : generate_target concat_intr.bd
//Design      : concat_intr
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "concat_intr,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=concat_intr,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "concat_intr.hwdef" *) 
module concat_intr
   (Intr_in_0,
    Intr_in_1,
    Intr_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTR_IN_0 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTR_IN_0, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input Intr_in_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTR_IN_1 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTR_IN_1, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input Intr_in_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTR_OUT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTR_OUT, PortWidth 2, SENSITIVITY LEVEL_HIGH:LEVEL_HIGH" *) output [1:0]Intr_out;

  wire Intr_in_0_1;
  wire Intr_in_1_1;
  wire [1:0]xlconcat_0_dout;

  assign Intr_in_0_1 = Intr_in_0;
  assign Intr_in_1_1 = Intr_in_1;
  assign Intr_out[1:0] = xlconcat_0_dout;
  concat_intr_xlconcat_0_0 xlconcat_0
       (.In0(Intr_in_0_1),
        .In1(Intr_in_1_1),
        .dout(xlconcat_0_dout));
endmodule
