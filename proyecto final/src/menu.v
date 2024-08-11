module menu (
    input clk,
    input keypad_pressed,
    input [3:0] presente,
    input [4:0] key,
    output reg [6:0] display_a,
    output reg [6:0] display_b,
    output reg [6:0] display_c,
    output reg [6:0] display_d,
    output reg [6:0] disp,
    output reg [2:0] heroe,
    input [6:0] data,
    output reg cambio = 1'd0,
    output reg [2:0] heroe_seleccionado,
    input [1:0] mov,
    input [1:0] v_d,
    input encendido
);

  // Parámetros para la máquina de estado
  parameter apagado = 4'd0, hola = 4'd1, personaje = 4'd2, juego = 4'd3, GP = 4'd4, YN = 4'd5;

  // Parámetro para el divisor de reloj
  parameter divider = 27'd13_500_000;  // Clock divider for 2 Hz
  reg [3:0] contador = 4'd1;  // Counter for sweeping (starts from 1)
  reg [26:0] counter = 27'd0;
  reg clk_out;
  reg [25:0] delay = 26'd0;  // Variable para debounce
  //  reg [2:0] heroe_seleccionado;  //variable para almacenar heroe
  reg clk_hero;

  reg [3:0] old_state;  /// variable para evitar bugs del display

  always @(posedge clk) begin
    counter <= counter + 27'd1;
    if (counter >= (divider - 1)) counter <= 27'd0;
    clk_out <= (counter <= divider / 2) ? 1'b1 : 1'b0;
  end  // Clock divider

  always @(*) begin
    if (presente == 4'd2) begin
      clk_hero <= clk;
    end else clk_hero <= 1'd0;
  end

  // Hero change
  always @(posedge clk_hero) begin
    if (encendido) begin
      if (presente == 4'd2) begin
        if (delay > 0) begin
          delay <= delay - 1;
        end
        if (keypad_pressed && key == 5'd12 && delay == 0) begin
          heroe <= heroe + 3'd1;
          heroe_seleccionado <= heroe;  // Almacenar el héroe seleccionado
          delay <= 13_500_000;
        end
        if (heroe == 3'd6) begin
          heroe <= 3'd0;
          heroe_seleccionado <= 3'd0;
        end
        cambio <= (heroe != 3'd0) ? 1'd1 : 1'd0;
      end
    end else if (!encendido) begin
      heroe <= 3'd0;
      heroe_seleccionado <= 3'd0;
    end else begin
      heroe <= 3'd0;
      heroe_seleccionado <= 3'd0;
    end
  end

  // Sweeping "Choose Hero" display
  always @(posedge clk_out) begin
    if (presente != 4'd0) begin
      contador <= contador + 4'd1;
      if (contador >= 4'd15) begin
        contador <= 4'd0;
      end
    end else contador <= 4'd0;
    if (old_state != presente) begin
      old_state <= presente; /////manejar variables para evitar rebotes y bugs del display
      contador  <= 4'd0;
    end
  end

  // Barrido en el display "Choose Hero"
  always @(posedge clk_out) begin
    case (presente)
      personaje: begin
        //if (!cambio) begin
        case (contador)
          4'd1   : disp = 7'b1001110; // Letter 'c'
          4'd2   : disp = 7'b0110111; // Letter 'h'
          4'd3   : disp = 7'b1111110; // Letter 'o'
          4'd4   : disp = 7'b1111110; // Letter 'o'
          4'd5   : disp = 7'b1011011; // Letter 's'
          4'd6   : disp = 7'b1001111; // Letter 'e'
          4'd7   : disp = 7'b0000000; // Space 
          4'd8   : disp = 7'b0110111; // Letter 'h'
          4'd9   : disp = 7'b1001111; // Letter 'e'
          4'd10  : disp = 7'b0000101; // Letter 'r'
          4'd11  : disp = 7'b1111110; // Letter 'o'
          default: disp = 7'b0000000; // Space 
        endcase
        //end
      end
      GP: begin
        if (v_d == 2'd2) begin
          case (contador)
            4'd1   : disp = 7'b0111011; // Letter 'y'
            4'd2   : disp = 7'b1111110; // Letter 'o'
            4'd3   : disp = 7'b0111110; // Letter 'u'
            4'd4   : disp = 7'b1111110; // Space 
            4'd5   : disp = 7'b0111010; // Letter 'w'
            4'd6   : disp = 7'b0110000; // Letter 'i'
            4'd7   : disp = 7'b0111010; // letter 'n'
            default: disp = 7'b0000000; // Space 
          endcase
        end else if (v_d == 2'd1) begin
          case (contador)
            4'd1   : disp = 7'b0111011; // Letter 'y'
            4'd2   : disp = 7'b1111110; // Letter 'o'
            4'd3   : disp = 7'b0111110; // Letter 'u'
            4'd4   : disp = 7'b0000000; // Space 
            4'd5   : disp = 7'b0001110; // Letter 'l'
            4'd6   : disp = 7'b1111110; // Letter 'o'
            4'd7   : disp = 7'b1011011; // letter 's'
            4'd8  : disp = 7'b100111; // letter  't'
            default: disp = 7'b0000000; // Space 
          endcase
        end
      end
      YN: begin
        case (contador)
          4'd1   : disp = 7'b1100111; // Letter 'p'
          4'd2   : disp = 7'b1111110; // Letter 'l'
          4'd3   : disp = 7'b1110111; // Letter 'a'
          4'd4   : disp = 7'b0111011; // Letter 'y' 
          4'd5   : disp = 7'b1110111; // Letter 'a'
          4'd6   : disp = 7'b1111011; // Letter 'g'
          4'd7   : disp = 7'b1110111; // letter 'a'
          4'd8  : disp = 7'b1001110; // letter  'i'
          4'd9   : disp = 7'b0111010; // Letter 'n'
          4'd10  : disp = 7'b0111011; // Letter 'y'
          4'd11  : disp = 7'b1111110; // Letter 'o'
          4'd12  : disp = 7'b0000101; // Letter 'r'
          4'd13  : disp = 7'b0111010; // Letter 'n'
          4'd14  : disp = 7'b1111110; // Letter 'o'
          default: disp = 7'b0000000; // Space 
        endcase
      end
      default: ;
    endcase
  end


  // Actualización de displays basada en el estado actual
  always @(posedge clk_out) begin
    case (presente)
      hola: begin
        display_a <= 7'b0110111;  // 'h'
        display_b <= 7'b1111110;  // 'o'
        display_c <= 7'b0001110;  // 'l'
        display_d <= 7'b1110111;  // 'a'
      end
      personaje: begin
        // Mostrar el barrido en los displays
        display_d <= disp;
        display_c <= display_d;
        display_b <= display_c;
        display_a <= display_b;
      end
      juego: begin
        // Mostrar datos del personaje seleccionado
        display_a <= data;
        display_b <= 7'd0;
        display_c <= 7'd0;
        display_d <= 7'd0;
      end
      GP: begin
        display_d <= disp;
        display_c <= display_d;
        display_b <= display_c;
        display_a <= display_b;
      end
      YN: begin
        display_d <= disp;
        display_c <= display_d;
        display_b <= display_c;
        display_a <= display_b;
      end
      default: ;
    endcase
    if (presente == 4'd2 && cambio != 1'd0) begin
      display_d <= 7'd0;
      display_c <= 7'd0;
      display_b <= 7'd0;
      display_a <= data;
    end
  end
endmodule
