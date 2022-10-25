`timescale 1ns/1ps
`default_nettype none

module test_adder_n; 

    logic [31:0] a; 
    logic [31:0] b; 
    logic c_in; 
    logic [31:0] sum; 
    logic [31:0] y; 
    wire  c_out; 

    adder_n UUT32(a, b, c_in, sum, c_out);

    initial begin

        $dumpfile("adder_n.vcd");
        $dumpvars(0, UUT32); 
        $display("Testing 32-bit adder");

        for (int i = 0; i < 128; i++) begin
            a = $urandom%4294967295;
            b = $urandom%4294967295;
            c_in = 0;
            y = a + b;
            #1
            if (y !== sum) begin
                $error("0x%8x + 0x%8x (expected 0x%8x)", a, b, y, sum);
            end
            $display("%1b %2b %3b | %4b %5b", a, b, c_in, sum, c_out); 
        end

        for (int i = 0; i < 32; i++) begin
            for (int j = 0; j < 32; j++) begin
                a = 1 << i;
                b = 1 << j;
                c_in = 0;
                y = a + b; 
                #1
                if (y !== sum) begin
                    $error("0x%8x + 0x%8x (expected 0x%8x)", a, b, y, sum);
                end
            end
        end
        
        a = 1 << 31;
        b = 1 << 31;
        #1

        if (c_out != 1) begin
            $error("Carry out does not function properly.");
        end
        $finish;
    end

endmodule