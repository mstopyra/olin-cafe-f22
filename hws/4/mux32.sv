	
`timescale 1ns/1ps
`default_nettype none

// Making 32 different inputs is annoying, so I use python:
// print(", ".join([f"in{i:02}" for i in range(32)]))
// The solutions will include comments for where I use python-generated HDL.

module mux32(
  in00, in01, in02, in03, in04, in05, in06, in07, in08, in09, in10, 
  in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, 
  in22, in23, in24, in25, in26, in27, in28, in29, in30, in31,
  select, out);

	//parameter definitions
	parameter N = 32;
	//port definitions
  // python: print(", ".join([f"in{i:02}" for i in range(32)]))
	input  wire [(N-1):0] in00, in01, in02, in03, in04, in05, in06, in07, in08, 
    in09, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, 
    in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
	
  input  wire [4:0] select;
	output logic [(N-1):0] out;

  wire [(N-1):0] o0, o1, o2, o3, o4, o5, o6, o7, out_0, out_1;


  mux4_1 m1(.in00(in00), .in01(in01), .in02(in02), .in03(in03), .select(select[1:0]), .out(o0));
  mux4_1 m2(.in00(in04), .in01(in05), .in02(in06), .in03(in07), .select(select[1:0]), .out(o1));
  mux4_1 m3(.in00(in08), .in01(in09), .in02(in10), .in03(in11), .select(select[1:0]), .out(o2));
  mux4_1 m4(.in00(in12), .in01(in13), .in02(in14), .in03(in15), .select(select[1:0]), .out(o3));
  mux4_1 m5(.in00(in16), .in01(in17), .in02(in18), .in03(in19), .select(select[1:0]), .out(o4));
  mux4_1 m6(.in00(in20), .in01(in21), .in02(in22), .in03(in23), .select(select[1:0]), .out(o5));
  mux4_1 m7(.in00(in24), .in01(in25), .in02(in26), .in03(in27), .select(select[1:0]), .out(o6));
  mux4_1 m8(.in00(in28), .in01(in29), .in02(in30), .in03(in31), .select(select[1:0]), .out(o7));

  mux4_1 m9(.in00(o0), .in01(o2), .in02(o2), .in03(o3), .select(select[3:2]), .out(out_0));
  mux4_1 m10(.in00(o4), .in01(o5), .in02(o6), .in03(o7), .select(select[3:2]), .out(out_1));

  mux2_1 m11(.in00(out_0), .in01(out_1), .select(select[4]), .out(out));


endmodule




