// Verilog testbench created by dumbTestbench.py
`timescale 100ns / 1ns

module agc;

reg rst = 1;
reg STRT2 = 1;
initial
  begin
    $dumpfile("agc.lxt2");
    $dumpvars(0, agc);
    # 1 rst = 0;
    # 50 STRT2 = 0;
    # 1000 $finish;
  end

reg CLOCK = 0;
always #2.44140625 CLOCK = !CLOCK;

reg CAD4 = 0, CAD5 = 0, CAD6 = 0, CGA12 = 0, CGG = 0, CSG = 0, EB10 = 0,
  EB11_ = 0, EB9 = 0, G01 = 0, G02 = 0, G03 = 0, G04 = 0, G05 = 0, G06 = 0,
  G07 = 0, G08 = 0, G09 = 0, G10 = 0, G11 = 0, G12 = 0, G13 = 0, G14 = 0,
  G15 = 0, G16 = 0, GOJAM = 0, IC15_ = 0, L02_ = 0, L15_ = 0, MONPAR = 0,
  OCTAD2 = 0, R6 = 0, RAD = 0, RPTAD4 = 0, RPTAD5 = 0, RPTAD6 = 0, SAP = 0,
  SCAD = 0, SCADBL = 0, SHANC = 0, SHINC = 0, T02_ = 0, T03 = 0, T04 = 0,
  T05 = 0, T07 = 0, T10 = 0, T12_ = 0, T7PHS4_ = 0, TPARG_ = 0, TSUDO_ = 0,
  WEDOPG_ = 0, WL01_ = 0, WL02_ = 0, WL03_ = 0, WL04_ = 0, WL05_ = 0, WL06_ = 0,
  WL07_ = 0, WL08_ = 0, WL09_ = 0, WL10_ = 0, WL11_ = 0, WL12_ = 0, WL13_ = 0,
  WL14_ = 0, WSG_ = 0, XB0_ = 0, XB1_ = 0, XB2_ = 0, XB3_ = 0, d8XP5 = 0;

wire BRXP3, CYL_, CYR_, EAD09, EAD09_, EAD10, EAD10_, EAD11, EAD11_, EDOP_,
  EXTPLS, G01A, G01A_, G01ED, G02ED, G03ED, G04ED, G05ED, G06ED, G07ED,
  G16A_, GEMP, GEQZRO_, GINH, GNZRO, INHPLS, L02A_, L15A_, MGP_, MPAL_,
  MSCDBL_, MSP, PA03, PA03_, PA06, PA06_, PA09, PA09_, PA12, PA12_, PA15,
  PA15_, PALE, PB09, PB09_, PB15, PB15_, PC15, PC15_, RADRG, RADRZ, RELPLS,
  RL03_, RL04_, RL05_, RL06_, RSC_, S01, S01_, S02, S02_, S03, S03_, S04,
  S04_, S05, S05_, S06, S06_, S07, S07_, S08, S08_, S09, S09_, S10, S10_,
  S11, S11_, S12, S12_, SHIFT, SHIFT_, SR_, T03_, T04_, T05_, T07_, T10_,
  T12A, WGA_, WG_;

A12 iA12 (
  rst, CAD4, CAD5, CAD6, CGA12, CGG, CSG, EB10, EB11_, EB9, G01, G02, G03,
  G04, G05, G06, G07, G08, G09, G10, G11, G12, G13, G14, G15, G16, GOJAM,
  IC15_, L02_, L15_, MONPAR, OCTAD2, R6, RAD, RPTAD4, RPTAD5, RPTAD6, SAP,
  SCAD, SCADBL, SHANC, SHINC, T02_, T03, T04, T05, T07, T10, T12_, T7PHS4_,
  TPARG_, TSUDO_, WEDOPG_, WL01_, WL02_, WL03_, WL04_, WL05_, WL06_, WL07_,
  WL08_, WL09_, WL10_, WL11_, WL12_, WL13_, WL14_, WSG_, XB0_, XB1_, XB2_,
  XB3_, d8XP5, BRXP3, G01A_, GEMP, GNZRO, MGP_, MPAL_, MSCDBL_, MSP, PA03,
  PA03_, PA06, PA06_, PA09, PA09_, PA12, PA12_, PA15, PA15_, RL03_, RL04_,
  RL05_, RL06_, RSC_, S09_, S10_, T03_, T04_, T05_, T07_, T10_, T12A, WG_,
  CYL_, CYR_, EAD09, EAD09_, EAD10, EAD10_, EAD11, EAD11_, EDOP_, EXTPLS,
  G01A, G01ED, G02ED, G03ED, G04ED, G05ED, G06ED, G07ED, G16A_, GEQZRO_,
  GINH, INHPLS, L02A_, L15A_, PALE, PB09, PB09_, PB15, PB15_, PC15, PC15_,
  RADRG, RADRZ, RELPLS, S01, S01_, S02, S02_, S03, S03_, S04, S04_, S05,
  S05_, S06, S06_, S07, S07_, S08, S08_, S09, S10, S11, S11_, S12, S12_,
  SHIFT, SHIFT_, SR_, WGA_
);

initial $timeformat(-9, 0, " ns", 10);
initial $monitor("%t: %d", $time, CLOCK);

endmodule