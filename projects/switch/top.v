`timescale 10ns/1ns

module top(
  input in_a,
  input in_b,
  output out
);
  assign out = in_a & in_b;
endmodule