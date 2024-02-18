`timescale 10ns/1ns

module and_gate_tb();
  reg in_a, in_b;
  wire out;

  and_gate_project UUT (
    .in_a(in_a),
    .in_b(in_b),
    .out(out)
  );

  initial
    begin
      in_a <= 1'b0;
      in_b <= 1'b0;
      #10;

      in_a <= 1'b0;
      in_b <= 1'b1;
      #10;

      in_a <= 1'b1;
      in_b <= 1'b0;
      #10;

      in_a <= 1'b1;
      in_b <= 1'b1;
      #10;
    end
endmodule