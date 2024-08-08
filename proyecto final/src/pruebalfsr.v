module lfsr (
    input clk,
    input rst,
    input [3:0] presente,  // Señal de habilitación para el LFSR
    output wire [3:0] obs_aleo
);
  reg [27:0] counter = 28'd0;
  parameter divider = 28'd71_000_000;  // clock divider de 1/3 hz
  reg clk_out;

  // Se definen los registros internos del LFSR
  reg [3:0] lfsr_reg = 4'b0001;

  always @(posedge clk) begin
    counter <= counter + 28'd1;
    if (counter >= (divider - 1)) counter <= 28'd0;
    clk_out <= (counter <= divider / 2) ? 1'b1 : 1'b0;
  end

  always @(posedge clk_out) begin
    if (presente != 4'd3) begin
      // Si presente no esta en juego, se reinicia el registro
      lfsr_reg <= 4'b0010;  // Puedes cambiar el valor inicial para obtener diferentes secuencias
    end else begin
      // Si lo esta, se realiza el desplazamiento y la retroalimentación
      lfsr_reg <= {lfsr_reg[2:0], lfsr_reg[3] ^ lfsr_reg[0]};  // Retroalimentación XOR
    end
  end

  // Asigna la salida del LFSR al registro de salida
  assign obs_aleo = lfsr_reg;

  /*always @(posedge clk_out) begin
    if (presente == 4'd3) begin
      if (rst) begin
        // Si la señal de reset está activa, se reinicia el registro
        lfsr_reg <= 4'b0010;  // Puedes cambiar el valor inicial para obtener diferentes secuencias
      end else begin
        // Si no hay reset, se realiza el desplazamiento y la retroalimentación
        lfsr_reg <= {lfsr_reg[2:0], lfsr_reg[3] ^ lfsr_reg[0]};  // Retroalimentación XOR
      end
    end
  end*/
endmodule
