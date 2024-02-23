`timescale 10ns/1ns

module tb();
  reg in_a, in_b;
  wire out;

  top UUT (
    .in_a(in_a),
    .in_b(in_b),
    .out(out)
  );

  initial
    begin
      in_a <= 1'b0;
      in_b <= 1'b0;
      #10;
      assert(out == 1'b0);

      in_a <= 1'b0;
      in_b <= 1'b1;
      #10;
      assert(out == 1'b0);

      in_a <= 1'b1;
      in_b <= 1'b0;
      #10;
      assert(out == 1'b0);

      in_a <= 1'b1;
      in_b <= 1'b1;
      #10;
      assert(out == 1'b1);
    end
endmodule