module choque #(
    // Parámetros para la máquina de estado
    parameter apagado = 4'd0,
    hola = 4'd1,
    personaje = 4'd2,
    juego = 4'd3,
    GP = 4'd4,
    YN = 4'd5
) (
    input clk_ob,
    output reg [1:0] v_d = 2'd0,
    //    input [1:0]world,
    input [20:0] disp_obs,
    input [3:0] presente,
    input [6:0] data,
    input encendido,
    output reg bono = 1'd0
);

  always @(posedge clk_ob) begin ////casos donde el heroe pierde o no   v_d=2'd1 el heroe pierde,2'd0 nada, 2'd2 gana
    if (presente == juego || presente == GP) begin
      case (disp_obs[6:0])  ///cada uno de los objetos
        7'b0001111: begin  /////objeto 1
          if (data != 7'b1000000) begin
            v_d <= 2'd1;  ////compara con posibilidad de posible pasar, si es diferente heroe pierde
          end else v_d <= 2'd0;
        end

        7'b1100011: begin  ////objeto 2
          if (data != 7'b0001000) begin
            v_d <= 2'd1;
          end else v_d <= 2'd0;
        end

        7'b0111000: begin  ////// objeto 3
          if (data == 7'b0000001) begin
            v_d <= 2'd0;
          end else if (data == 7'b1000000) begin
            v_d <= 2'd0;
          end else if (data == 7'b0000110) begin
            v_d <= 2'd0;
          end else v_d <= 2'd1;
        end

        7'b0010011: begin  ////objeto 4 
          if (data == 7'b0001000) begin
            v_d <= 2'd0;
          end else if (data == 7'b1000000) begin
            v_d <= 2'd0;
          end else v_d <= 2'd1;
        end

        7'b1000001: begin  ///objeto 5
          if (data == 7'b0001000) begin
            v_d <= 2'd0;
          end else if (data == 7'b0000110) begin
            v_d <= 2'd0;
          end else v_d <= 2'd1;
        end

        7'b0111111: begin  ////objeto 6
          if (data != 7'b1000000) begin
            v_d <= 2'd1;
          end else v_d <= 2'd0;
        end

        7'b0110110: begin  ///objeto 7
          if (data == 7'b1000000) begin
            v_d <= 2'd0;
          end else if (data == 7'b0001000) begin
            v_d <= 2'd0;
          end else if (data == 7'b0000001) begin
            v_d <= 2'd0;
          end else v_d <= 2'd1;
        end

        7'b0010101: begin  ///objeto 8
          if (data == 7'b1000000) begin
            v_d <= 2'd0;
          end else if (data == 7'b0001000) begin
            v_d <= 2'd0;
          end else v_d <= 2'd1;
        end

        7'b0110001: begin  ////objeto 9
          if (data == 7'b1000000) begin
            v_d <= 2'd0;
          end else if (data == 7'b0001000) begin
            v_d <= 2'd0;
          end else if (data == 7'b0000110) begin
            v_d <= 2'd0;
          end else v_d <= 2'd1;
        end
        7'b1111110: begin  ////objeto 10
          if (data != 7'b0000001) begin
            v_d <= 2'd1;
          end else v_d <= 2'd0;
        end
        default: ;
      endcase
    end else begin
      v_d <= 2'd0;
    end
    if (presente == 4'd0) begin
      v_d <= 2'd0;
    end
  end

endmodule
