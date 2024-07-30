module SELECTOR (
    input clk,
    arriba,
    abajo,
    ok,
    estado_selec,
    output reg [2:0] per_select,
    output reg sal_estado
);

  always @(posedge clk) begin
    if (ok) begin
      sal_estado = 1;
    end else begin
      sal_estado = 0;
    end
  end

  initial begin
    per_select = 0;
  end

  always @(posedge clk) begin
    if (arriba && (per_select < 5) && estado_selec) begin
      per_select <= per_select + 3'd1;
    end else if (abajo && (per_select > 0) && estado_selec) begin
      per_select <= per_select - 3'd1;
    end
  end

endmodule  //SELECTOR
