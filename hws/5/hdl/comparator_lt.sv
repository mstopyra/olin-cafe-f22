module comparator_lt(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;
wire signed [N-1:0] sum;
logic c_out;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.

// Copy any other modules you use into the HDL folder and update the Makefile accordingly.

adder_n LT(.a(a), .b(~b), .c_in(1'b1), .sum(sum), .c_out(c_out));

always_comb begin

    out = sum[N-1] ^ ((a[N-1] ~^ b[N-1] ~^ 1'b0) & (a[N-1] ^ sum[N-1]) & 1'b1); 
    //out = sum[N-1] ^ sum[N];

    //Need to account for overflow cases
    /* When overflow occurs msb (sum[N-1]) is an incorrect indication of whether or not 
        a < b. Thus a < b iff  out = Negative flag ^ oVerflow flag */

end

endmodule


