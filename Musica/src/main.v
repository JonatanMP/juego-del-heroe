module main (
    input  clk,
    input  boton,
    reset,
    output musica
);
  //estado
  wire [1:0] estado;

  notas notas (
      .clk(clk),
      .estado(estado),
      .musica(musica)
  );

  estados estados (
      .clk(clk),
      .estado(estado),
      .boton(boton),
      .reset(reset)
  );

endmodule
