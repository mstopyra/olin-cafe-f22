/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle ever "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);

parameter N = 8;
input logic clk, rst, ena;
input logic [N-1:0] ticks;
output logic out;

logic [N-1:0] counter, counter_plus;
logic counter_comparator;
logic local_rst;

always_comb begin
 
  counter_plus = counter + 1'b1;
  //eq Comparator
  counter_comparator = &(ticks ~^ counter_plus);
  //Resets when counter == ticks 
  local_rst = rst | counter_comparator; 

end

always_ff @(posedge clk) begin

  if(local_rst) begin
    counter <= 0;
    end

  else if(ena) begin
    counter <= counter_plus; 
    end 

end
endmodule
