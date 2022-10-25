`timescale 1ns/1ps
`default_nettype none

module test_mux32;

    parameter N=32;

    logic [(N*N-1):0] d;
    logic [4:0] select;
	logic [(N-1):0] out;
    logic [(N-1):0] rand_out;

    
    mux32 UUT (.in00(d[31:0]), .in01(d[63:32]), .in02(d[95:64]), .in03(d[127:96]), .in04(d[159:128]), .in05(d[191:160]), 
    .in06(d[223:192]), .in07(d[255:224]), .in08(d[287:256]), .in09(d[319:288]), .in10(d[351:320]), .in11(d[383:352]), 
    .in12(d[415:384]), .in13(d[447:416]), .in14(d[479:448]), .in15(d[511:480]), .in16(d[543:512]), .in17(d[575:544]), 
    .in18(d[607:576]), .in19(d[639:608]), .in20(d[671:640]), .in21(d[703:672]), .in22(d[735:704]), .in23(d[767:736]), 
    .in24(d[799:768]), .in25(d[831:800]), .in26(d[863:832]), .in27(d[895:864]), .in28(d[927:896]), .in29(d[959:928]), 
    .in30(d[991:960]), .in31(d[1023:992]), .select(select), .out(out));

    initial begin

        $dumpfile("test_mux32.vcd");
        $dumpvars(0, UUT);
        $display("\nTesting 32:1 mux");
        
        d = 0; 

        //Assign random bitstrings to d in range of largest 32 bit integer
        for (int j = 0; j < 32; j++) begin

            d = $urandom%4294967295<<(j*N); //Implements a 32*j bitshift 

        end

        //Goes through all select values and random inputs and checks whether or not
        //mux operates properly. 
        for (int i = 0; i < 32; i++) begin
            select = i;
            rand_out = d >> (N*i); // output is shifted back
            #1 //Sets delay in hardware
            
            if(out !== rand_out) begin
                $error("%4b got 0x%8x (expected 0x%8x)", select, out, rand_out);
            end
        end
        $finish;
    end
//If there are no errors, mux functions as expected
endmodule