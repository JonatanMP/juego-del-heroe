module enemigos (
    input clk,
    output reg [6:0] enemigo,
    input [2:0] ene_select
);

  always @(posedge clk) begin
    case (ene_select)  //abcdefg
      0: enemigo <= 7'b1100000;  // arriba
      1: enemigo <= 7'b1000010;  // arriba
      2: enemigo <= 7'b1100011;  // arriba
      3: enemigo <= 7'b0011110;  // abajo
      4: enemigo <= 7'b0001100;  // abajo
      5: enemigo <= 7'b0011000;  // abajo
      6: enemigo <= 7'b0011100;  // abajo

    endcase
  end
endmodule  //enemigos
