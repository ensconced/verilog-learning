module top(
  input in,
  input clk,
  output out
);
  reg reg_a, reg_b;
  always @(posedge clk) begin
    reg_a <= in;
    if (reg_a & ~in) begin
      reg_b <= ~reg_b;
    end
  end
  assign out = reg_b;
endmodule
