module audioselec (
    input clk,
    input [3:0] presente,
    output musica
);
  //estado
  wire estado;
  wire muic1, muic2, muic3, muic4;

  parameter apagado = 4'd0, hola = 4'd1, personaje = 4'd2, juego = 4'd3, GP = 4'd4, YN = 4'd5;

  notas notas (
      .clk(clk),
      .estado(estado),
      .muic1(muic1)
  );

  notas_Mario notas_Mario (
      .clk(clk),
      .estado(estado),
      .muic2(muic2)
  );

  notas_tetriz notas_tetriz (
      .clk(clk),
      .estado(estado),
      .muic3(muic3)
  );

  notas_zelda notas_zelda (
      .clk(clk),
      .estado(estado),
      .muic4(muic4)
  );

  // estados estados (
  //     .clk(clk),
  //     .estado(estado),
  //     .boton(boton),
  //     .reset(reset)
  // );


  always @(posedge clk) begin

    if (presente == hola || presente == personaje) begin
      estado <= 1;
      musica <= muic1;
    end else if (presente == juego) begin
      estado <= 1;
      musica <= muic2;
    end else if (presente == GP && v_d == 2'd2) begin
      estado <= 1;
      musica <= muic3;
    end else if (presente == GP && v_d == 2'd1) begin
      estado <= 1;
      musica <= muic4;
    end else begin
      musica <= 0;
      estado <= 0;
    end 

  end

b

endmodule
