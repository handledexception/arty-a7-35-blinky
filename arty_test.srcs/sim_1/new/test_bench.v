`timescale 1ns / 1ps

module test_bench;
reg clk, clk2 = 0; // 100MHz
wire divided_clk;

// wrapper (Unit Under Test)
clock_divider UUT_A (
.clk(clk),
.divided_clk(divided_clk)
);
clock_divider UUT_B (
.clk(clk2),
.divided_clk(divided_clk)
);

always #5 clk = ~clk; // every 5ns the signal flips around => 10ns period => 100MHz
always #12 clk2 = ~clk2;
endmodule
