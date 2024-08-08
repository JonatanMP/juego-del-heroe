module top (
    input clk,
    input [3:0] columna,
    output [3:0] fila,
    output [6:0] display_controlador,
    output [3:0] enable_display,
    output encendido
);

  //keypad
  wire [4:0] key;
  wire keypad_pressed;

  //fsm
  wire [3:0] presente;

  //display
  wire [6:0] display_a, display_b, display_c, display_d;

  //menu
  wire [6:0] disp;
  wire cambio;

  //rom_personaje
  wire [6:0] data;
  wire [2:0] heroe;
  wire [1:0] mov;

  keypad keypad (
      .clk(clk),
      .columna(columna),
      .fila(fila),
      .key(key),
      .keypad_pressed(keypad_pressed)
  );

  fsm fsm (
      .clk(clk),
      .key(key),
      .keypad_pressed(keypad_pressed),
      .presente(presente),
      .encendido(encendido)
  );

  display display (
      .clk(clk),
      .encendido(encendido),
      .display_a(display_a),
      .display_b(display_b),
      .display_c(display_c),
      .display_d(display_d),
      .display_controlador(display_controlador),
      .enable_display(enable_display),
      .presente(presente),
      .cambio(cambio),
      .data(data)
  );

  menu menu (
      .clk(clk),
      .encendido(encendido),
      .display_a(display_a),
      .display_b(display_b),
      .display_c(display_c),
      .display_d(display_d),
      .presente(presente),
      .disp(disp),
      .key(key),
      .keypad_pressed(keypad_pressed),
      .data(data),
      .cambio(cambio),
      .heroe(heroe)
  );

  rom_personaje rom_personaje (
      .clk  (clk),
      .data (data),
      .heroe(heroe),
      .mov  (mov)
  );

  juego juego (
      .clk(clk),
      .mov(mov),
      .keypad_pressed(keypad_pressed),
      .presente(presente),
      .key(key)
  );

endmodule
