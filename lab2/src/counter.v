module counter (
  input clk,
  input ce,
  output [3:0] LEDS
);
    // TODO: delete this assignment once you write your own logic.
    //assign LEDS = 4'd0;

    // TODO: Instantiate a register (from the 151 library) to count the number of cycles
    // required to reach one second. Note that our clock period is 8ns.
    // Think about how many bits are needed for your register.

    // TODO: Instantiate a register to hold the current count,
    // and assign this value to the LEDS.

    // TODO: update the register if clock is enabled (ce is 1).
    // Once the requisite number of cycles is reached, increment the count.
  
  wire [27:0] reg28_out = 28'h0000000;
  wire [27:0] reg28_in;
  
  wire [27:0] limit = 125000000;
  wire reset;
  
  assign reg28_in = reg28_out + 1;
  assign reset = reg28_out >= limit;
  
  REGISTER_R_CE #(28) state (.q(reg28_out), .d(reg28_in), .rst(reset), .ce(ce), .clk(clk));
  
  wire [3:0] count = 0;
  wire [3:0] reg4_in;
  
  assign reg4_in = count + 1;
  assign LEDS = count;
  
  REGISTER #(4) state4 (.q(count), .d(reg4_in), .clk(reset));
  
endmodule

