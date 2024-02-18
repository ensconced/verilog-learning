module top #(parameter DEBOUNCE_LIMIT = 20) (
  input in,
  input clk,
  output out
);
  reg [$clog2(DEBOUNCE_LIMIT) - 1:0] count = 0;
  reg state = 1'b0;

  always(@posedge clk) begin
    if (in === state)
      begin
        count <= 0;
      end
    else if (count < DEBOUNCE_LIMIT - 1)
      begin
        count <= count + 1;
      end
    else
      begin
        state <= in;
        count <= 0;
      end
  end

  assign out = state;
endmodule