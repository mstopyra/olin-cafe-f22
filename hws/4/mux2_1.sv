`timescale 1ns/1ps
`default_nettype none

module mux2_1(in00, in01, select, out);

  parameter N = 32;
  input wire [(N-1):0] in00, in01;
  input select;
  output [(N-1):0] out;

  assign out = select ? in01 : in00;
  
endmodule
