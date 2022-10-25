`timescale 1ns/1ps
`default_nettype none

module adder_n(a, b, c_in, sum, c_out);

parameter N = 32;

input  wire [N-1:0] a, b; //Creates two N-bit inputs
input wire c_in; //Input for carried bit
output logic [N-1:0] sum; //Sum of a and b (32 bit bus)
output wire c_out; //output for carried bit

//The 3 lines below specify what the inital carry bits are and creates a list of carries to keep track of
wire [N:0] carries; 
assign carries[0] = c_in;
assign c_out = carries[N];

generate
//Loops through all bits in a and b, sums them together, finds all carries and applies them when needed
  genvar i;
  for(i = 0; i < N; i++) begin : ripple_carry
    adder_1 ADDER (
      .a(a[i]),
      .b(b[i]),
      .c_in(carries[i]),
      .sum(sum[i]),
      .c_out(carries[i+1])
    );
  end
endgenerate

endmodule
/* to instantiate
   adder_n #(.N(32)) adder_32bit_a ( port list );*/