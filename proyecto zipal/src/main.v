module top (
    input clk,
    input [3:0] columna,
    output [3:0] fila,
    output [6:0] display_controlador,
    output [3:0] enable_display,
    output encendido,
    musica
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
  wire [2:0] heroe_seleccionado;

  //rom_personaje
  wire [6:0] data;
  wire [2:0] heroe;
  wire [1:0] mov;
  // wire pulseofkey;

  ///juego
  // wire inicial;


  ///lfsr
  wire [20:0] disp_obs;
  wire [6:0] obstaculos;
  // wire [1:0] world;
  wire [3:0] obs_aleo;
  wire clk_ob;


  ///choque
  wire [1:0] v_d;
  wire bono;

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
      .heroe_seleccionado(heroe_seleccionado),
      .v_d(v_d),
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
      .disp_obs(disp_obs),
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
      .heroe_seleccionado(heroe_seleccionado),
      .v_d(v_d),
      .heroe(heroe),
      .mov(mov)
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
      .key(key),
      .heroe(heroe),
      // .encendido(encendido),
      .cambio(cambio),
      .heroe_seleccionado(heroe_seleccionado)
  );

  lfsr lfsr (
      .clk(clk),
      .presente(presente),
      .obs_aleo(obs_aleo),
      // .world(world),
      .obstaculos(obstaculos),
      .clk_ob(clk_ob),
      .v_d(v_d),
      .disp_obs(disp_obs),
      .encendido(encendido)
  );

  rom_obstaculos rom_obstaculos (
      .clk(clk),
      .obs_aleo(obs_aleo),
      .obstaculos(obstaculos)
  );

  choque choque (
      .clk_ob(clk_ob),
      .disp_obs(disp_obs),
      .presente(presente),
      .bono(bono),
      .data(data),
      .encendido(encendido),
      .v_d(v_d)
  );

  audioselec audioselec (
      .clk(clk),
      .presente(presente),
      .musica(musica)
  );
endmodule
