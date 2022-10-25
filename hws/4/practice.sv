`timescale 1ns/1ps
`default_nettype none

module practice(input logic rst, clk, ena, seed, 
                output logic out);

    logic[1:0] q0; 
    logic[1:0] q1;
    logic[1:0] s1;
    logic[1:0] d0;

    always_ff @(posedge clk) begin

        q0 <= d0 & ~rst;
        q1 <= q0 & ~rst;
        out <= q1 & ~rst;

    end

    always_comb begin
        
        s1 = q0 ^ q1;
        d0 = ena ? s1 : seed;

    end
endmodule
