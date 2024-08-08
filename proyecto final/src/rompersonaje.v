module rom_personaje (
    input clk,
    input [2:0] heroe,
    input [1:0] mov,
    output reg [6:0] data
);

  /////////////////abcdefg
  parameter u = 7'b0111110;  ///personaje U
  parameter i = 7'b0110000;  ///personaje I
  parameter p = 7'b1100111;  ///personaje P
  parameter f = 7'b1000111;  ///personaje F
  parameter e = 7'b1001111;  ///personaje E

  // Movimientos del héroe
  parameter volar = 7'b1000000;
  parameter saltar = 7'b0000001;
  parameter agachar = 7'b000100;
  // ROM con 5 personajes (U, I, P, F, E)
  always @(posedge clk) begin
    case (mov)
      2'd0: begin
        case (heroe)
          3'd1:    data <= u;
          3'd2:    data <= i;
          3'd3:    data <= p;
          3'd4:    data <= f;
          3'd5:    data <= e;
          default: data <= 7'd0;
        endcase
      end
      2'd1: data <= volar;
      2'd2: data <= saltar;
      2'd3: data <= agachar;
    endcase
  end
endmodule
