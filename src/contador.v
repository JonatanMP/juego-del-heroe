module contador (
    input clk,
    jugando,
    output reg [7:0] segundos,
    output next
);
  reg clkout;
  reg [24:0] contador, contador1;
  reg reset;
  reg [7:0] cont, cont1;
  reg [6:0] rom;
  reg [3:0] selec;
  reg win, next, disp1, disp2, disp3;

  parameter divisor = 25'd27000000;

  initial begin
    contador = 0;
    segundos = 0;
    cont = 0;
    cont1 = 0;
    clkout = 0;
    next = 1;
    jugando = 1;
    win = 0;
  end

  /////////////// Divisor de frecuencia ///////////////
  always @(posedge clk) begin
    contador <= contador + 25'd1;
    if (contador >= (divisor - 1)) contador <= 25'd0;
    clkout <= (contador < divisor / 2) ? 1'b1 : 1'b0;
  end

    always @(posedge clk) begin
    contador1 <= contador1 + 25'd1;
    if (contador1 >= (divisor1 - 1)) contador1 <= 25'd0;
    clkout1 <= (contador1 < divisor1 / 2) ? 1'b1 : 1'b0;
  end
  /////////////////////////////////////////////////////////////

  ////////////////// Contador ///////////////////////////
  always @(posedge clkout) begin
    cont <= 8'd0;
    if (jugando == 1'd1) begin
      cont <= cont + 8'd1;
      if (cont >= 8'd60) begin
        next <= 2'd2;
      end else if (cont >= 8'd135) begin
        next <= 2'd3;
      end else if (cont >= 8'd225) begin
        win <= 1;
      end
    end
  end

   always @(posedge clk) begin
    cont1 <= cont1 + 1;
  end

  always @(posedge clk) begin
    segundos <= cont;
  end
  //////////////////////////////////////////////////////

  always @(posedge clk) begin
    case ()  //abcdefg
      0: rom <= 1111110;
      1: rom <= 0110000;
      2: rom <= 1101101;
      3: rom <= 1111001;
      4: rom <= 0110011;
      5: rom <= 1011011;
      6: rom <= 1011111;
      7: rom <= 1110000;
      8: rom <= 1111111;
      9: rom <= 1111011;
    endcase
  end
  //////////////////////////////////////

  always @(posedge clk) begin
    unidades = cont % 10;
    decenas = (cont / 10) % 10;
    centenas = (cont / 100) % 10;
  end

  always @(posedge clk) begin
    rom <= unidades
  end

  always @(posedge clk) begin
    
  end
endmodule  //contador