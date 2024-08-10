module juego #(
   // Parámetros para la máquina de estado
  parameter apagado = 4'd0, hola = 4'd1, personaje = 4'd2, juego = 4'd3, GP = 4'd4, YN = 4'd5
) (
    input clk,
    input keypad_pressed,
  //  input [3:0] obs_aleo,
    input [3:0] presente,
    input [4:0] key,
    input [2:0] heroe,
    output reg [1:0] mov = 2'd0,
    input [2:0] heroe_seleccionado,
    input cambio
);

  reg [2:0] cambio_heroe;

  always @(posedge clk) begin
    cambio_heroe <= heroe_seleccionado;  // Actualiza el héroe seleccionado

    if (presente == 4'd3) begin
      // Si la tecla es presionada y la tecla específica corresponde a volar, saltar o agacharse, actualiza `mov`.
      if (keypad_pressed) begin
        if (key == 5'd2) begin
          mov <= 2'd1;  // Hero vuela si el botón 2 es presionado
          cambio_heroe <= 3'd0;  // Restablece el héroe al seleccionado
        end else if (key == 5'd6) begin
          mov <= 2'd2;  // Hero salta si el botón 6 es presionado
          cambio_heroe <= 3'd0;  // Restablece el héroe al seleccionado
        end else if (key == 5'd8) begin
          mov <= 2'd3;  // Hero se agacha si el botón 8 es presionado
          cambio_heroe <= 3'd0;  // Restablece el héroe al seleccionado
        end else begin
          mov <= 2'd0;  // Mantiene el valor actual de `mov` si ninguna tecla relevante es presionada
        end
      end else begin
        // Si no se presiona ninguna tecla, mantiene el valor actual de `mov`
        mov <= mov;
      end
    end else begin
      // Si no estamos en el estado de juego, mantiene el valor actual de `mov`
      mov <= mov;
    end
  end

endmodule




