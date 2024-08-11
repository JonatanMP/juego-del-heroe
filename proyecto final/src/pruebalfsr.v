module lfsr (
    input clk,
    input [3:0] presente,  // Señal de habilitación para aleatoriedad
    input [6:0] obstaculos,
    input [1:0] v_d,
    input encendido,
    output reg [20:0] disp_obs = 21'd0,
    output reg clk_ob,
    output reg [3:0] obs_aleo = 4'd0
);
  // Parámetros para la máquina de estado
  parameter apagado = 4'd0, hola = 4'd1, personaje = 4'd2, juego = 4'd3, GP = 4'd4, YN = 4'd5;

  reg [27:0] counter = 28'd0;
  reg [27:0] divider = 28'd0;  // Clock divider para controlar la frecuencia
  // reg clk_ob;  // Clock de los obstáculos

  reg [2:0] counter_obj = 3'd0;
  reg [3:0] conteo_juego = 4'd1;
  reg [6:0] n_obj = 7'd0;
  reg [3:0] lfsr_reg = 4'd1;
  wire feedback_value;
  wire [3:0] lfsr_next;

  reg world = 1'd0;

  always @(posedge clk) begin
    counter <= counter + 28'd1;
    if (counter >= (divider - 1)) counter <= 28'd0;
    clk_ob <= (counter <= divider / 2) ? 1'b1 : 1'b0;
  end  //Clock divider

  always @(posedge clk) begin
    if (presente == juego) begin
      world   <= 1'd1;
      divider <= 28'd27_000_000;  // Clock de 1 Hz para obstáculos
    end else begin
      world   <= 1'd0;
      divider <= 28'd0;  // Apagar el clock divider cuando no está en el juego
    end
  end

  always @(posedge clk_ob) begin
    if (presente == juego && v_d == 2'd0) begin
      if (n_obj == 7'd0) begin
        lfsr_reg <= conteo_juego;
        n_obj <= 7'd25;  // Resetear el numero de objetos
        counter_obj <= 3'd0;
      end else begin
        n_obj <= n_obj - 7'd1;
        counter_obj <= counter_obj + 3'd1;
      end

      case (counter_obj)
        3'd0: begin
          obs_aleo <= lfsr_reg;
          disp_obs[20:14] <= obstaculos;
        end
        3'd1: begin
          disp_obs[20:14] <= 7'd0;
          lfsr_reg <= lfsr_next;
        end
        3'd2: begin
          obs_aleo <= lfsr_reg;
          disp_obs[20:14] <= obstaculos;
        end
        3'd3: begin
          disp_obs[20:14] <= 7'd0;
          lfsr_reg <= lfsr_next;
        end
        3'd4: begin
          obs_aleo <= lfsr_reg;
          disp_obs[20:14] <= obstaculos;
        end
        3'd5: begin
          disp_obs[20:14] <= 7'd0;
          lfsr_reg <= lfsr_next;
        end
        3'd6: begin
          obs_aleo <= lfsr_reg;
          disp_obs[20:14] <= obstaculos;
        end
        3'd7: begin
          disp_obs[20:14] <= 7'd0;
          lfsr_reg <= lfsr_next;
        end
      endcase

      // Manejo de bonos
      if (n_obj == 7'd5) begin
        obs_aleo <= 4'd11;  // cada cierto tiempo hace el manejo de un bono asegurado
        disp_obs[20:14] <= 7'd0;
      end else if (n_obj == 7'd4) begin
        obs_aleo <= 4'd7;  // asegurar un valor para agregar mas ''aleatoriedad''
        disp_obs[20:14] <= 7'd0;
      end else if (n_obj == 7'd2) begin
        obs_aleo <= 4'd4;  // asegurar un valor para agregar mas ''aleatoriedad''
        disp_obs[20:14] <= 7'd0;
      end else if (n_obj == 7'd1) begin
        disp_obs[20:14] <= 7'd0;
        counter_obj <= 3'd0;  // reset
      end
      if (world && v_d == 2'd0) begin
        disp_obs[13:7] <= disp_obs[20:14];
        disp_obs[6:0]  <= disp_obs[13:7];

      end else if (v_d == 2'd1) begin
        disp_obs[13:7]  <= 7'd0;
        disp_obs[20:14] <= 7'd0;
        disp_obs[6:0]   <= 7'd0;
      end  ///barrido
    end
  end
  // end

  // Definición de la retroalimentación del LFSR
  assign feedback_value = lfsr_reg[3] ^ lfsr_reg[2] ^ lfsr_reg[1] ^ lfsr_reg[0];
  assign lfsr_next = {feedback_value, lfsr_reg[3:1]};

endmodule


