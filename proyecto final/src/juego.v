module juego #(
    ///parametros maquina de estado
    parameter apagado = 4'd0,
    hola = 4'd1,
    personaje = 4'd2,
    juego = 4'd3
) (
    input clk,
    keypad_pressed,
    input [3:0] obs_aleo,
    input [3:0] presente,
    input [4:0] key,
    output reg [1:0] mov = 2'd0
);

  always @(posedge clk) begin
    if (presente == 4'd3) begin
      if (keypad_pressed && key == 5'd2) begin
        mov <= 2'd1;  // Hero vuela si el boton es presionado
      end else if (keypad_pressed && key == 5'd6) begin
        mov <= 2'd2;  // Hero salta si el boton es presionado
      end else if (keypad_pressed && key == 5'd8) begin
        mov <= 2'd3;  // Hero se agacha si el boton es presionado
      end else begin
        mov <= 2'd0;  // Default display
      end
    end
  end
endmodule





