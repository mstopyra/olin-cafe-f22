# Homework 4
The written portion is available [here](https://docs.google.com/document/d/1XybXmTD5-NTJ1gfLq3tYb-wUUDJGZS8xgO912DLf50Q/edit?usp=sharing)

## 32:1 Mux implementation: 
In order to create a 32:1 mux, I created 2:1 and 4:1 mux modules (mux4_1.sv and mux2_1.sv). I then intantiated 8 4:1 muxs with all 32 inputs, sent their 8 outputs into 2 4:1 muxs, and sent those two outputs into a 2:1 mux (seen in mux32.sv).

### Mux testing: 
To test my 32:1 mux, I created a loop which generates random 32-bit numbers for each input, then mapped these values to each select bitstring to generate a theoretical result. I then verified my mapped results with the output of my mux when the same inputs were used (test_mux32.sv).

*To run this test navigate to hws/4 and run "make test_mux32" in the terminal"*

## 32-bit adder implementation: 
In order to create a 32-bit adder, I daisy chained many 1-bit adders (adder_1.sv) together to create a N-bit ripple carry adder (adder_n.sv), and I then set N to be 32 bits. 

### Adder testing:
To test my adder, I put together 128 sums and there respective carries based off of randomly generated 32-bit a and b values. I then verified these sums by running the same numbers through my n-bit adder.
 
*To run this test navigate to hws/4 and run "make test_adder_n" in the terminal"*


Add a pdf of your written answers to this folder, then use `make clean` then `make submission` to submit!