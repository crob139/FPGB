////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : xaw2verilog
//  /   /         Filename : systemPLL.v
// /___/   /\     Timestamp : 05/25/2018 11:34:26
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -st C:\Users\craig robertson\Desktop\i2c\i2c\ipcore_dir\.\systemPLL.xaw C:\Users\craig robertson\Desktop\i2c\i2c\ipcore_dir\.\systemPLL
//Design Name: systemPLL
//Device: xc5vlx50t-1ff1136
//
// Module systemPLL
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
// For block PLL_ADV_INST, Estimated PLL Jitter for CLKOUT0 = 0.537 ns
// For block PLL_ADV_INST, Estimated PLL Jitter for CLKOUT1 = 0.418 ns
// For block PLL_ADV_INST, Estimated PLL Jitter for CLKOUT2 = 0.418 ns
`timescale 1ns / 1ps

module systemPLL(CLKIN1_N_IN, 
                 CLKIN1_P_IN, 
                 RST_IN, 
                 CLKOUT0_OUT, 
                 CLKOUT1_OUT, 
                 CLKOUT2_OUT, 
                 LOCKED_OUT);

    input CLKIN1_N_IN;
    input CLKIN1_P_IN;
    input RST_IN;
   output CLKOUT0_OUT;
   output CLKOUT1_OUT;
   output CLKOUT2_OUT;
   output LOCKED_OUT;
   
   wire CLKFBOUT_CLKFBIN;
   wire CLKIN1_IBUFGDS;
   wire CLKOUT0_BUF;
   wire CLKOUT1_BUF;
   wire CLKOUT2_BUF;
   wire GND_BIT;
   wire [4:0] GND_BUS_5;
   wire [15:0] GND_BUS_16;
   wire VCC_BIT;
   
   assign GND_BIT = 0;
   assign GND_BUS_5 = 5'b00000;
   assign GND_BUS_16 = 16'b0000000000000000;
   assign VCC_BIT = 1;
   IBUFGDS  CLKIN1_IBUFGDS_INST (.I(CLKIN1_P_IN), 
                                .IB(CLKIN1_N_IN), 
                                .O(CLKIN1_IBUFGDS));
   BUFG  CLKOUT0_BUFG_INST (.I(CLKOUT0_BUF), 
                           .O(CLKOUT0_OUT));
   BUFG  CLKOUT1_BUFG_INST (.I(CLKOUT1_BUF), 
                           .O(CLKOUT1_OUT));
   BUFG  CLKOUT2_BUFG_INST (.I(CLKOUT2_BUF), 
                           .O(CLKOUT2_OUT));
   PLL_ADV #( .BANDWIDTH("OPTIMIZED"), .CLKIN1_PERIOD(5.000), 
         .CLKIN2_PERIOD(10.000), .CLKOUT0_DIVIDE(120), .CLKOUT1_DIVIDE(20), 
         .CLKOUT2_DIVIDE(20), .CLKOUT0_PHASE(0.000), .CLKOUT1_PHASE(0.000), 
         .CLKOUT2_PHASE(270.000), .CLKOUT0_DUTY_CYCLE(0.500), 
         .CLKOUT1_DUTY_CYCLE(0.500), .CLKOUT2_DUTY_CYCLE(0.500), 
         .COMPENSATION("SYSTEM_SYNCHRONOUS"), .DIVCLK_DIVIDE(25), 
         .CLKFBOUT_MULT(63), .CLKFBOUT_PHASE(0.0), .REF_JITTER(0.000000) ) 
         PLL_ADV_INST (.CLKFBIN(CLKFBOUT_CLKFBIN), 
                         .CLKINSEL(VCC_BIT), 
                         .CLKIN1(CLKIN1_IBUFGDS), 
                         .CLKIN2(GND_BIT), 
                         .DADDR(GND_BUS_5[4:0]), 
                         .DCLK(GND_BIT), 
                         .DEN(GND_BIT), 
                         .DI(GND_BUS_16[15:0]), 
                         .DWE(GND_BIT), 
                         .REL(GND_BIT), 
                         .RST(RST_IN), 
                         .CLKFBDCM(), 
                         .CLKFBOUT(CLKFBOUT_CLKFBIN), 
                         .CLKOUTDCM0(), 
                         .CLKOUTDCM1(), 
                         .CLKOUTDCM2(), 
                         .CLKOUTDCM3(), 
                         .CLKOUTDCM4(), 
                         .CLKOUTDCM5(), 
                         .CLKOUT0(CLKOUT0_BUF), 
                         .CLKOUT1(CLKOUT1_BUF), 
                         .CLKOUT2(CLKOUT2_BUF), 
                         .CLKOUT3(), 
                         .CLKOUT4(), 
                         .CLKOUT5(), 
                         .DO(), 
                         .DRDY(), 
                         .LOCKED(LOCKED_OUT));
endmodule