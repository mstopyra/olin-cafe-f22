`timescale 1ns/1ps
`default_nettype none

module mux4_1(in00, in01, in02, in03, select, out);

  parameter N = 32;
  input wire [(N-1):0] in00, in01, in02, in03;
  input [1:0] select;
  output [(N-1):0] out;

  /* - When sel[1] is low, (sel[0] ? in01 : in00) is used.
     - When sel[1] is high, (sel[0] ? in03 : in02) is used.*/ 
  assign out = select[1] ? (select[0] ? in03 : in02) : (select[0] ? in01 : in00);
  
endmodule