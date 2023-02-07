`timescale 1ns / 1ps

module clock_divider #(parameter freq = 1)
(
input wire clk, // 100MHz
output reg divided_clk = 0 // 1Hz => 0.5s ON and 0.5s OFF
);

// Desired frequency 1Hz, test by creating simulation.
// div_value = 100MHz/(2*desired_freq) - 1
// 100,000,000Hz/(2*1Hz)-1 = 49999999
//localparam div_value = 49999999;
localparam div_value = (100000000/(2*freq))-1;

// counter
integer counter_value = 0; // 32-bit wide reg bus

always@ (posedge clk) // sensitivity list - rising edge 0-1
begin
    // count up
    if (counter_value == div_value)
        counter_value <= 0; // reset counter
    else
        counter_value <= counter_value+1;
end

// divide clock
always@ (posedge clk)
begin
    // delaying the divided clock for 1000 input clock cycles
    if (counter_value == div_value)
        divided_clk <= ~divided_clk; // flip the signal
    else
        divided_clk <= divided_clk; // store value
end

endmodule
