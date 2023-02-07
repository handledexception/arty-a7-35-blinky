`timescale 1ns / 1ps

module top(
input wire clk, // 100MHz
output wire led_a,
output wire led_b,
output wire led_c,
output wire led_d
);

wire div_clk;

clock_divider #(.freq(1)) led_blink1 (
.clk(clk),
.divided_clk(led_a)
);
clock_divider #(.freq(2)) led_blink2 (
.clk(clk),
.divided_clk(led_b)
);
clock_divider #(.freq(3)) led_blink3 (
.clk(clk),
.divided_clk(led_c)
);
clock_divider #(.freq(4)) led_blink4 (
.clk(clk),
.divided_clk(led_d)
);
clock_divider #(.freq(12000000)) do_led_ring (
.clk(clk),
.divided_clk(div_clk)
);

endmodule
