module rom_obstaculos (
    input clk,
    input [3:0] obs_aleo,
    output reg [6:0] obstaculos
);

  //////////obstaculos abcdefg
  parameter obs_1 = 7'b0001111;  //casi una e
  parameter obs_2 = 7'b1100011;  ///un cuadrado arriba
  parameter obs_3 = 7'b0111000;  ///L al reves
  parameter obs_4 = 7'b0010011;  //no se que es
  parameter obs_5 = 7'b1000001;  // dos rayas
  parameter obs_6 = 7'b0111111;  //no se tampoco que es
  parameter obs_7 = 7'b0110110;  //paredes 
  parameter obs_8 = 7'b0010101;  //una silla
  parameter obs_9 = 7'b0110001;  //ni pregunte tampoco se
  parameter obs_10 = 7'b1111110;  // el 0 para trollear
  //bonus
  parameter bonus = 7'b0110000;  //numero 1, representa 10 puntos de bonus
  parameter bonus_2 = 7'b1101101;  //numero 2, representa 20 puntos
  parameter bonus_3 = 7'b1111001;  //numero 3, representa 30 puntos

  always @(*) begin
    case (obs_aleo)
      4'd0:   obstaculos= 7'b0001111;
      4'd1:    obstaculos = 7'b1100011;
      4'd2:    obstaculos = 7'b0111000;
      4'd3:    obstaculos =7'b0010011;
      4'd4:    obstaculos = 7'b1000001;
      4'd5:    obstaculos = 7'b0111111;
      4'd6:    obstaculos = 7'b0110110;
      4'd7:    obstaculos = 7'b0010101;
      4'd8:    obstaculos = 7'b0110001;
      4'd9:    obstaculos = 7'b1111110;
      4'd10: obstaculos =bonus;
      4'd11:obstaculos=bonus_2;
      4'd12:obstaculos=bonus_3;
      default:obstaculos = 7'b0000000;
    endcase
  end
endmodule
