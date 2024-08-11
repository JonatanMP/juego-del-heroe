module rom_personaje (
    input clk,
    input [2:0] heroe,
    input [1:0] mov,
    output reg [6:0] data
);

  // Parámetros para los personajes
  parameter u = 7'b0111110;  // Personaje U
  parameter i = 7'b0000110;  // Personaje I
  parameter p = 7'b1100111;  // Personaje P
  parameter f = 7'b1000111;  // Personaje F
  parameter e = 7'b1001111;  // Personaje E

  // Parámetros para los movimientos
  parameter volar = 7'b1000000;
  parameter saltar = 7'b0000001;
  parameter agachar = 7'b0001000;

  always @(*) begin
    case (mov)
      2'd0: begin
        // Selección del héroe
        case (heroe)
          3'd1: data = u;
          3'd2: data = i;
          3'd3: data = p;
          3'd4: data = f;
          3'd5: data = e;
          default: data = 7'd0;  // Valor por defecto si el héroe no está en el rango
        endcase
      end
      2'd1: data = volar;  // Movimiento volar
      2'd2: data = saltar;  // Movimiento saltar
      2'd3: data = agachar;  // Movimiento agachar
      default: data = 7'd0;  // Valor por defecto para movimientos no definidos
    endcase
  end

endmodule
