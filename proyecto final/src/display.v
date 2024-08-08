module display (
    input clk,
    output reg [6:0] display_controlador,
    output reg [3:0] enable_display,
    input [6:0] display_a,
    display_b,
    display_c,
    display_d,
    data,
    input encendido,
    input cambio,
    input [3:0] presente
);
  ///parametros maquina de estado
  parameter apagado = 4'd0, hola = 4'd1, personaje = 4'd2, juego = 4'd3;


  reg [6:0] disp0, disp1, disp2, disp3, disp4, disp5, disp6, disp7;

  parameter divider = 27'd1350;  /////clock de 20khz
  reg [26:0] counter = 27'd0;
  reg [1:0] count = 2'd0;
  reg clk_out;

  always @(posedge clk) begin
    counter <= counter + 27'd1;
    if (counter >= (divider - 1)) counter <= 27'd0;
    clk_out <= (counter < divider / 2) ? 1'b1 : 1'b0;
  end  ///clock divider

  always @(posedge clk_out) begin
    count <= count + 2'd1;
    if (count > 2'b11) count <= 2'b00;
    else count <= count + 2'd1;
  end

  always @(posedge clk) begin
    case (presente)
      apagado: begin
        disp0 <= 7'd0;
        disp1 <= 7'd0;
        disp2 <= 7'd0;
        disp3 <= 7'd0;
      end
      hola: begin
        disp0 <= display_a;
        disp1 <= display_b;
        disp2 <= display_c;
        disp3 <= display_d;
      end
      personaje: begin
        disp0 <= display_a;
        disp1 <= display_b;
        disp2 <= display_c;
        disp3 <= display_d;
      end
      juego: begin
        disp0 <= data;
        disp1 <= 7'd0;
        disp2 <= 7'd0;
        disp3 <= 7'd0;
      end
      default: begin

      end
    endcase
  end
  always @(posedge clk_out) begin
    case (count)
      2'd0: begin
        enable_display <= 4'b0111;
        display_controlador <= disp3;
      end
      2'd1: begin
        enable_display <= 4'b1011;
        display_controlador <= disp2;
      end
      2'd2: begin
        enable_display <= 4'b1101;
        display_controlador <= disp1;
      end

      2'd3: begin
        enable_display <= 4'b1110;
        display_controlador <= disp0;
      end
    endcase

  end
endmodule
