module fsm (
    input clk,
    input keypad_pressed,
    output reg [3:0] presente = 4'd0,
    output reg encendido = 1'd0,
    input [4:0] key
);
  parameter apagado = 4'd0, hola = 4'd1, personaje = 4'd2, juego = 4'd3;
  reg [25:0] delay = 26'd0;
  reg [ 1:0] enc_state = 2'd0;
  reg [ 4:0] key_in_delayed;
  reg [ 4:0] key_in_delayed2;

  // Debouncing para la señal keypad_pressed y key
  always @(posedge clk) begin
    key_in_delayed  <= {key_in_delayed, key};
    key_in_delayed2 <= key_in_delayed;
  end

  // Manejo del encendido y debouncing para PWRB
  always @(posedge clk) begin
    if (delay > 0) begin
      delay <= delay - 1;
    end
    if (keypad_pressed && key == 5'd1 && delay == 0) begin
      encendido <= ~encendido;
      delay <= 27000000;
    end
  end

  // Actualización de presente basado en encendido y transiciones
  always @(posedge clk) begin
    case (enc_state)
      2'd0: begin  // Estado de apagado
        presente <= apagado;
        if (encendido) begin
          enc_state <= 2'd1;  // Cambiar a estado encendido
        end
      end

      2'd1: begin  // Estado encendido
        if (!encendido) begin
          enc_state <= 2'd0;  // Cambiar a estado apagado
        end else begin
          case (presente)
            apagado: begin
              if (key_in_delayed == 5'd1) begin
                presente <= hola;
              end
            end
            hola: begin
              // Aquí se cambia de hola a personaje si se presiona la tecla correspondiente
              if (key_in_delayed2 == 5'd11) begin
                presente <= personaje;
              end
            end
            personaje: begin
              // Aquí se cambia de personaje a juego si se presiona la misma tecla
              if (key_in_delayed2 == 5'd13) begin
                presente <= juego;
              end
            end
            default: begin
              // vacio
            end
          endcase
        end
      end
    endcase
  end
endmodule
