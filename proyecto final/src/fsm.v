module fsm (
    input clk,
    input keypad_pressed,
    output reg [3:0] presente = 4'd0,
    output reg encendido = 1'd0,
    input [2:0] heroe_seleccionado,
    input [1:0] v_d,
    input [4:0] key
);
  // Parámetros para la máquina de estado
  parameter apagado = 4'd0, hola = 4'd1, personaje = 4'd2, juego = 4'd3, GP = 4'd4, YN = 4'd5;

  reg [25:0] delay = 26'd0;
  reg [ 1:0] enc_state = 2'd0;
  reg [ 4:0] key_in_delayed;
  reg [ 4:0] key_in_delayed2;
  reg [ 3:0] futuro;
  // Debouncing para la señal keypad_pressed y key
  always @(posedge clk) begin
    key_in_delayed  <= {key_in_delayed, key};
    key_in_delayed2 <= key_in_delayed;
  end

  // Manejo del encendido y debouncing para juego
  always @(posedge clk) begin
    if (delay > 0) begin
      delay <= delay - 1;
    end
    if (keypad_pressed && key == 5'd10 && delay == 0) begin
      encendido <= ~encendido;
      delay <= 27000000;
    end
  end

  // Actualización de presente basado en encendido y transiciones
  always @(posedge clk) begin
    if (keypad_pressed) begin
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
                if (key_in_delayed == 5'd10) begin
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
                // Aquí se cambia de personaje a juego si se presiona la tecla y si se ha elegido un personaje
                if (key_in_delayed2 == 5'd13 && heroe_seleccionado != 3'd0) begin
                  presente <= juego;
                end
              end
              YN: begin
                if (key_in_delayed2 == 5'd15) begin
                  presente <= juego;
                end else if (key_in_delayed2 == 5'd14) begin
                  presente <= hola;
                end
              end
              default: begin
                // vacio
              end
            endcase
          end
        end
      endcase
    end else begin
      presente <= futuro;
    end
  end
  ////////////////////////////////////timers para reset de pantalla
  reg [2:0] timer_pass = 3'd0;
  reg [3:0] timer_reset = 4'd0;
  parameter divider = 28'd27_000_000;
  reg clk_timer;
  reg [27:0] counter = 28'd0;

  always @(posedge clk) begin
    counter <= counter + 28'd1;
    if (counter >= (divider - 1)) counter <= 28'd0;
    clk_timer <= (counter <= divider / 2) ? 1'b1 : 1'b0;
  end  //Clock divider

  always @(posedge clk_timer) begin
    if (presente == juego) begin
      if (v_d == 2'd1 || v_d == 2'd2) begin
        timer_pass <= timer_pass + 3'd1;
      end else begin
        timer_pass <= 3'd0;
      end
    end

    if (presente == GP) begin
      if (v_d == 2'd1 || v_d == 2'd2) begin
        timer_reset <= timer_reset + 4'd1;
      end else begin
        timer_reset <= 4'd0;
      end
    end
  end

  //timer_reset <= timer_reset + 4'd1;
  //timer_reset <= 4'd0;
  always @(presente, v_d, timer_reset, timer_pass) begin
    futuro = presente;

    case (presente)
      juego: begin
        case (v_d)
          2'd1: begin
            if (timer_pass == 3'd2) begin
              futuro = GP;
            end else begin
              futuro = juego;
            end
          end
          2'd2: begin
            if (timer_pass == 3'd2) begin
              futuro = GP;
            end else begin
              futuro = juego;
            end
          end
          default: futuro = juego;
        endcase
      end

      GP: begin
        case (v_d)
          2'd1: if (timer_reset == 4'd10) futuro = YN;
          2'd2: if (timer_reset == 4'd10) futuro = YN;
          default: futuro = GP;
        endcase
      end
      default: ;
    endcase
  end

endmodule
