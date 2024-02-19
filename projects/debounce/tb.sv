`timescale 10ns/1ns

module tb();
  reg clk = 1'b0, in = 1'b0;

  always #2 clk <= !clk;

  top #(.DEBOUNCE_LIMIT(4)) UUT (
    .in(in),
    .clk(clk),
    .out(out)
  );

  initial begin
    repeat(3) @(posedge clk);
    in <= 1'b1; // toggle state of input pin

    @(posedge clk);
    in <= 1'b0; // simulate a glitch/bounce of switch

    @(posedge clk)
    in <= 1'b1; // bounce goes away

    repeat(6) @(posedge clk);
    $display("Test complete");
    $finish();
  end
endmodule