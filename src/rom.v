module pers_rom (
    input clk,
    input [6:0] personaje,
    output [2:0] per_select
);

always @(posedge clk) begin
  case (per_select)
  0: personaje <= 7'b0111110;  // U
  1: personaje <= 7'b0000110;  // i
  2: personaje <= 7'b1100111;  // P
  3: personaje <= 7'b1000111;  // F
  4: personaje <= 7'b1001111;  // E
  5: personaje <= 7'b0001000;  // ⬆️
  6: personaje <= 7'b1000000;  // ⬇️

  endcase
end

endmodule  //rom