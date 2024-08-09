module notas (
    input clk,
    input [1:0] estado,
    output reg musica
);

  /*Frecuencias de las Notas en la Octava C4 (4ta Octava)
C4 (Do): 261.63 Hz
C#4 / Db4 (Do# / Re♭): 277.18 Hz
D4 (Re): 293.66 Hz
D#4 / Eb4 (Re# / Mi♭): 311.13 Hz
E4 (Mi): 329.63 Hz
F4 (Fa): 349.23 Hz
F#4 / Gb4 (Fa# / Sol♭): 369.99 Hz
G4 (Sol): 392.00 Hz
G#4 / Ab4 (Sol# / La♭): 415.30 Hz
A4 (La): 440.00 Hz
A#4 / Bb4 (La# / Si♭): 466.16 Hz
B4 (Si): 493.88 Hz
Frecuencias de las Notas en la Octava C5 (5ta Octava)
C5 (Do): 523.25 Hz
C#5 / Db5 (Do# / Re♭): 554.37 Hz
D5 (Re): 587.33 Hz
D#5 / Eb5 (Re# / Mi♭): 622.25 Hz
E5 (Mi): 659.25 Hz
F5 (Fa): 698.46 Hz
F#5 / Gb5 (Fa# / Sol♭): 739.99 Hz
G5 (Sol): 783.99 Hz
G#5 / Ab5 (Sol# / La♭): 830.61 Hz
A5 (La): 880.00 Hz
A#5 / Bb5 (La# / Si♭): 932.33 Hz
B5 (Si): 987.77 Hz*/

  parameter [28:0] divider = 1_687_500;
  reg clk_out;
  reg [28:0] counter = 26'd0;
  reg [7:0] conteo = 8'd0;

  always @(posedge clk) begin
    counter <= counter + 29'd1;
    if (counter >= (divider - 1)) counter <= 29'd0;
    clk_out <= (counter <= divider / 2) ? 1'b1 : 1'b0;
  end  ///clock divider 16 hz

  always @(posedge clk_out) begin
    conteo <= 8'd0;
    if (estado == 1'd1) begin
      conteo <= conteo + 8'd1;
    end else if (conteo > 8'd240) begin
      conteo <= 8'd0;
    end else conteo <= conteo + 8'd1;
  end  //contador para cambio de notas y melodias


  parameter DO4 = 29'd103_053;  // 261.95 Hz
  parameter DB4 = 29'd97_473;  // 276.96 Hz
  parameter RE4 = 29'd91_837;  // 294.07 Hz
  parameter EB4 = 29'd86_817;  // 310.98 Hz
  parameter MI4 = 29'd81_818;  // 330.00 Hz
  parameter FA4 = 29'd77_364;  // 348.82 Hz
  parameter GB4 = 29'd72_973;  // 369.99 Hz
  parameter SOL4 = 29'd68_877;  // 392.00 Hz
  parameter AB4 = 29'd65_060;  // 415.30 Hz
  parameter LA4 = 29'd61_364;  // 439.99 Hz
  parameter BB4 = 29'd57_920;  // 466.16 Hz
  parameter SI4 = 29'd54_669;  // 493.88 Hz

  // Quinta octava
  parameter DO5 = 29'd51_600;  // 523.26 Hz
  parameter DB5 = 29'd48_704;  // 554.37 Hz
  parameter RE5 = 29'd45_971;  // 586.93 Hz
  parameter EB5 = 29'd43_391;  // 622.02 Hz
  parameter MI5 = 29'd40_956;  // 659.25 Hz
  parameter FA5 = 29'd38_656;  // 697.64 Hz
  parameter GB5 = 29'd36_487;  // 739.98 Hz
  parameter SOL5 = 29'd34_439;  // 784.00 Hz
  parameter AB5 = 29'd32_506;  // 830.60 Hz
  parameter LA5 = 29'd30_682;  // 879.99 Hz
  parameter BB5 = 29'd28_960;  // 932.32 Hz
  parameter SI5 = 29'd27_334;  // 987.77 Hz

  // Instanciaciones
  clks DO4_inst (
      .DIVISOR(DO4),
      .clk_in (clk),
      .clk_out(do4)
  );

  clks DB4_inst (
      .DIVISOR(DB4),
      .clk_in (clk),
      .clk_out(db4)
  );

  clks RE4_inst (
      .DIVISOR(RE4),
      .clk_in (clk),
      .clk_out(re4)
  );

  clks EB4_inst (
      .DIVISOR(EB4),
      .clk_in (clk),
      .clk_out(eb4)
  );

  clks MI4_inst (
      .DIVISOR(MI4),
      .clk_in (clk),
      .clk_out(mi4)
  );

  clks FA4_inst (
      .DIVISOR(FA4),
      .clk_in (clk),
      .clk_out(fa4)
  );

  clks GB4_inst (
      .DIVISOR(GB4),
      .clk_in (clk),
      .clk_out(gb4)
  );

  clks SOL4_inst (
      .DIVISOR(SOL4),
      .clk_in (clk),
      .clk_out(sol4)
  );

  clks AB4_inst (
      .DIVISOR(AB4),
      .clk_in (clk),
      .clk_out(ab4)
  );

  clks LA4_inst (
      .DIVISOR(LA4),
      .clk_in (clk),
      .clk_out(la4)
  );

  clks BB4_inst (
      .DIVISOR(BB4),
      .clk_in (clk),
      .clk_out(bb4)
  );

  clks SI4_inst (
      .DIVISOR(SI4),
      .clk_in (clk),
      .clk_out(si4)
  );

  // Quinta octava
  clks DO5_inst (
      .DIVISOR(DO5),
      .clk_in (clk),
      .clk_out(do5)
  );

  clks DB5_inst (
      .DIVISOR(DB5),
      .clk_in (clk),
      .clk_out(db5)
  );

  clks RE5_inst (
      .DIVISOR(RE5),
      .clk_in (clk),
      .clk_out(re5)
  );

  clks EB5_inst (
      .DIVISOR(EB5),
      .clk_in (clk),
      .clk_out(eb5)
  );

  clks MI5_inst (
      .DIVISOR(MI5),
      .clk_in (clk),
      .clk_out(mi5)
  );

  clks FA5_inst (
      .DIVISOR(FA5),
      .clk_in (clk),
      .clk_out(fa5)
  );

  clks GB5_inst (
      .DIVISOR(GB5),
      .clk_in (clk),
      .clk_out(gb5)
  );

  clks SOL5_inst (
      .DIVISOR(SOL5),
      .clk_in (clk),
      .clk_out(sol5)
  );

  clks AB5_inst (
      .DIVISOR(AB5),
      .clk_in (clk),
      .clk_out(ab5)
  );

  clks LA5_inst (
      .DIVISOR(LA5),
      .clk_in (clk),
      .clk_out(la5)
  );

  clks BB5_inst (
      .DIVISOR(BB5),
      .clk_in (clk),
      .clk_out(bb5)
  );

  clks SI5_inst (
      .DIVISOR(SI5),
      .clk_in (clk),
      .clk_out(si5)
  );

  always @(*) begin
    case (conteo)
      8'd0: musica <= 1'd0;
      8'd1: musica <= do4;
      8'd2: musica <= do4;
      8'd3: musica <= do4;
      8'd4: musica <= do4;
      8'd5: musica <= 1'd0;
      8'd6: musica <= do4;
      8'd7: musica <= do4;
      8'd8: musica <= do4;
      8'd9: musica <= do4;
      8'd10: musica <= 1'd0;
      8'd11: musica <= fa4;
      8'd12: musica <= fa4;
      8'd13: musica <= fa4;
      8'd14: musica <= fa4;
      8'd15: musica <= fa4;
      8'd16: musica <= fa4;
      8'd17: musica <= fa4;
      8'd18: musica <= fa4;
      8'd19: musica <= fa4;
      8'd20: musica <= 1'd0;
      8'd21: musica <= 1'd0;
      8'd22: musica <= 1'd0;
      8'd23: musica <= 1'd0;
      8'd24: musica <= 1'd0;
      8'd25: musica <= 1'd0;
      8'd26: musica <= mi5;
      8'd27: musica <= mi5;
      8'd28: musica <= mi5;
      8'd29: musica <= mi5;
      8'd30: musica <= 1'd0;
      8'd31: musica <= re5;
      8'd32: musica <= re5;
      8'd33: musica <= re5;
      8'd34: musica <= re5;
      8'd35: musica <= 1'd0;
      8'd36: musica <= do5;
      8'd37: musica <= do5;
      8'd38: musica <= do5;
      8'd39: musica <= do5;
      8'd40: musica <= 1'd0;
      8'd41: musica <= re5;
      8'd42: musica <= re5;
      8'd43: musica <= re5;
      8'd44: musica <= re5;
      8'd45: musica <= re5;
      8'd46: musica <= re5;
      8'd47: musica <= re5;
      8'd48: musica <= re5;
      8'd49: musica <= re5;
      8'd50: musica <= re5;
      8'd51: musica <= re5;
      8'd52: musica <= re5;
      8'd53: musica <= re5;
      8'd54: musica <= re5;
      8'd55: musica <= 1'd0;
      8'd56: musica <= 1'd0;
      8'd57: musica <= 1'd0;
      8'd58: musica <= la4;
      8'd59: musica <= la4;
      8'd60: musica <= la4;
      8'd61: musica <= la4;
      8'd62: musica <= si4;
      8'd63: musica <= si4;
      8'd64: musica <= si4;
      8'd65: musica <= si4;
      8'd66: musica <= 1'd0;
      8'd67: musica <= do5;
      8'd68: musica <= do5;
      8'd69: musica <= do5;
      8'd70: musica <= do5;
      8'd71: musica <= do5;
      8'd72: musica <= do5;
      8'd73: musica <= do5;
      8'd74: musica <= do5;
      8'd75: musica <= do5;
      8'd76: musica <= do5;
      8'd77: musica <= do5;
      8'd78: musica <= do5;
      8'd79: musica <= do5;
      8'd80: musica <= 1'd0;
      8'd81: musica <= 1'd0;
      8'd82: musica <= 1'd0;
      8'd83: musica <= 1'd0;
      8'd84: musica <= do5;
      8'd85: musica <= do5;
      8'd86: musica <= do5;
      8'd87: musica <= do5;
      8'd88: musica <= do5;
      8'd89: musica <= do5;
      8'd90: musica <= do5;
      8'd91: musica <= do5;
      8'd92: musica <= do5;
      8'd93: musica <= 1'd0;
      8'd94: musica <= re5;
      8'd95: musica <= re5;
      8'd96: musica <= re5;
      8'd97: musica <= re5;
      8'd98: musica <= re5;
      8'd99: musica <= 1'd0;
      8'd100: musica <= do5;
      8'd101: musica <= do5;
      8'd102: musica <= do5;
      8'd103: musica <= do5;
      8'd104: musica <= do5;
      8'd105: musica <= 1'd0;
      8'd106: musica <= si4;
      8'd107: musica <= si4;
      8'd108: musica <= si4;
      8'd109: musica <= si4;
      8'd110: musica <= si4;
      8'd111: musica <= si4;
      8'd112: musica <= si4;
      8'd113: musica <= si4;
      8'd114: musica <= si4;
      8'd115: musica <= si4;
      8'd116: musica <= si4;
      8'd117: musica <= si4;
      8'd118: musica <= si4;
      8'd119: musica <= 1'd0;
      8'd120: musica <= 1'd0;
      8'd121: musica <= 1'd0;
      8'd122: musica <= 1'd0;
      8'd123: musica <= 1'd0;
      8'd124: musica <= do4;
      8'd125: musica <= do4;
      8'd126: musica <= do4;
      8'd127: musica <= do4;
      8'd128: musica <= 1'd0;
      8'd129: musica <= do4;
      8'd130: musica <= do4;
      8'd131: musica <= do4;
      8'd132: musica <= do4;
      8'd133: musica <= fa4;
      8'd134: musica <= fa4;
      8'd135: musica <= fa4;
      8'd136: musica <= fa4;
      8'd137: musica <= fa4;
      8'd138: musica <= fa4;
      8'd139: musica <= fa4;
      8'd140: musica <= fa4;
      8'd141: musica <= 1'd0;
      8'd142: musica <= 1'd0;
      8'd143: musica <= 1'd0;
      8'd144: musica <= 1'd0;
      8'd145: musica <= 1'd0;
      8'd146: musica <= 1'd0;
      8'd147: musica <= 1'd0;
      8'd148: musica <= 1'd0;
      8'd149: musica <= 1'd0;
      8'd150: musica <= 1'd0;
      8'd151: musica <= mi5;
      8'd152: musica <= mi5;
      8'd153: musica <= mi5;
      8'd154: musica <= mi5;
      8'd155: musica <= 1'd0;
      8'd156: musica <= re5;
      8'd157: musica <= re5;
      8'd158: musica <= re5;
      8'd159: musica <= re5;
      8'd160: musica <= 1'd0;
      8'd161: musica <= do5;
      8'd162: musica <= do5;
      8'd163: musica <= do5;
      8'd164: musica <= do5;
      8'd165: musica <= do5;
      8'd166: musica <= 1'd0;
      8'd167: musica <= re5;
      8'd168: musica <= re5;
      8'd169: musica <= re5;
      8'd170: musica <= re5;
      8'd171: musica <= re5;
      8'd172: musica <= re5;
      8'd173: musica <= re5;
      8'd174: musica <= re5;
      8'd175: musica <= re5;
      8'd176: musica <= re5;
      8'd177: musica <= re5;
      8'd178: musica <= re5;
      8'd179: musica <= re5;
      8'd180: musica <= re5;
      8'd181: musica <= 1'd0;
      8'd182: musica <= 1'd0;
      8'd183: musica <= 1'd0;
      8'd184: musica <= la4;
      8'd185: musica <= la4;
      8'd186: musica <= la4;
      8'd187: musica <= la4;
      8'd188: musica <= si4;
      8'd189: musica <= si4;
      8'd190: musica <= si4;
      8'd191: musica <= si4;
      8'd192: musica <= 1'd0;
      8'd193: musica <= do5;
      8'd194: musica <= do5;
      8'd195: musica <= do5;
      8'd196: musica <= do5;
      8'd197: musica <= do5;
      8'd198: musica <= do5;
      8'd199: musica <= do5;
      8'd200: musica <= do5;
      8'd201: musica <= do5;
      8'd202: musica <= do5;
      8'd203: musica <= do5;
      8'd204: musica <= do5;
      8'd205: musica <= do5;
      8'd206: musica <= 1'd0;
      8'd207: musica <= 1'd0;
      8'd208: musica <= 1'd0;
      8'd209: musica <= 1'd0;
      8'd210: musica <= 1'd0;
      8'd211: musica <= 1'd0;
      8'd212: musica <= do5;
      8'd213: musica <= do5;
      8'd214: musica <= do5;
      8'd215: musica <= do5;
      8'd216: musica <= do5;
      8'd217: musica <= do5;
      8'd218: musica <= do5;
      8'd219: musica <= 1'd0;
      8'd220: musica <= 1'd0;
      8'd221: musica <= si4;
      8'd222: musica <= si4;
      8'd223: musica <= si4;
      8'd224: musica <= si4;
      8'd225: musica <= si4;
      8'd226: musica <= si4;
      8'd227: musica <= si4;
      8'd228: musica <= si4;
      8'd229: musica <= si4;
      8'd230: musica <= si4;
      8'd231: musica <= la4;
      8'd232: musica <= la4;
      8'd233: musica <= la4;
      8'd234: musica <= la4;
      8'd235: musica <= la4;
      8'd236: musica <= la4;
      8'd237: musica <= la4;
      8'd238: musica <= la4;
      8'd239: musica <= la4;
      8'd240: musica <= la4;
      default: musica <= 1'd0;  // Valor por defecto
    endcase
  end
endmodule





/////////////////////////////////clk module
module clks (
    input [28:0] DIVISOR,
    input clk_in,
    output reg clk_out
);

  reg [29:0] counter;

  //////////////////////////////////////clock divider///////////////////////////////
  always @(posedge clk_in) begin
    counter <= counter + 28'd1;
    if (counter >= (DIVISOR - 1)) counter <= 28'd0;
    clk_out <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
  end

endmodule
//////////////////////////////////////clock divider///////////////////////////////



module notas_zelda (
    input clk,
    input [1:0] estado,
    output reg musica
);

  /*Frecuencias de las Notas en la Octava C4 (4ta Octava)
C4 (Do): 261.63 Hz
C#4 / Db4 (Do# / Re♭): 277.18 Hz
D4 (Re): 293.66 Hz
D#4 / Eb4 (Re# / Mi♭): 311.13 Hz
E4 (Mi): 329.63 Hz
F4 (Fa): 349.23 Hz
F#4 / Gb4 (Fa# / Sol♭): 369.99 Hz
G4 (Sol): 392.00 Hz
G#4 / Ab4 (Sol# / La♭): 415.30 Hz
A4 (La): 440.00 Hz
A#4 / Bb4 (La# / Si♭): 466.16 Hz
B4 (Si): 493.88 Hz
Frecuencias de las Notas en la Octava C5 (5ta Octava)
C5 (Do): 523.25 Hz
C#5 / Db5 (Do# / Re♭): 554.37 Hz
D5 (Re): 587.33 Hz
D#5 / Eb5 (Re# / Mi♭): 622.25 Hz
E5 (Mi): 659.25 Hz
F5 (Fa): 698.46 Hz
F#5 / Gb5 (Fa# / Sol♭): 739.99 Hz
G5 (Sol): 783.99 Hz
G#5 / Ab5 (Sol# / La♭): 830.61 Hz
A5 (La): 880.00 Hz
A#5 / Bb5 (La# / Si♭): 932.33 Hz
B5 (Si): 987.77 Hz*/

  parameter [28:0] divider = 1_687_500;
  reg clk_out;
  reg [28:0] counter = 26'd0;
  reg [7:0] conteo = 8'd0;

  always @(posedge clk) begin
    counter <= counter + 29'd1;
    if (counter >= (divider - 1)) counter <= 29'd0;
    clk_out <= (counter <= divider / 2) ? 1'b1 : 1'b0;
  end  ///clock divider 16 hz

  always @(posedge clk_out) begin
    conteo <= 8'd0;
    if (estado == 1'd1) begin
      conteo <= conteo + 8'd1;
    end else if (conteo > 8'd240) begin
      conteo <= 8'd0;
    end else conteo <= conteo + 8'd1;
  end  //contador para cambio de notas y melodias


  parameter DO4 = 29'd103_053;  // 261.95 Hz
  parameter DB4 = 29'd97_473;  // 276.96 Hz
  parameter RE4 = 29'd91_837;  // 294.07 Hz
  parameter EB4 = 29'd86_817;  // 310.98 Hz
  parameter MI4 = 29'd81_818;  // 330.00 Hz
  parameter FA4 = 29'd77_364;  // 348.82 Hz
  parameter GB4 = 29'd72_973;  // 369.99 Hz
  parameter SOL4 = 29'd68_877;  // 392.00 Hz
  parameter AB4 = 29'd65_060;  // 415.30 Hz
  parameter LA4 = 29'd61_364;  // 439.99 Hz
  parameter BB4 = 29'd57_920;  // 466.16 Hz
  parameter SI4 = 29'd54_669;  // 493.88 Hz

  // Quinta octava
  parameter DO5 = 29'd51_600;  // 523.26 Hz
  parameter DB5 = 29'd48_704;  // 554.37 Hz
  parameter RE5 = 29'd45_971;  // 586.93 Hz
  parameter EB5 = 29'd43_391;  // 622.02 Hz
  parameter MI5 = 29'd40_956;  // 659.25 Hz
  parameter FA5 = 29'd38_656;  // 697.64 Hz
  parameter GB5 = 29'd36_487;  // 739.98 Hz
  parameter SOL5 = 29'd34_439;  // 784.00 Hz
  parameter AB5 = 29'd32_506;  // 830.60 Hz
  parameter LA5 = 29'd30_682;  // 879.99 Hz
  parameter BB5 = 29'd28_960;  // 932.32 Hz
  parameter SI5 = 29'd27_334;  // 987.77 Hz

  // Instanciaciones
  clks DO4_inst (
      .DIVISOR(DO4),
      .clk_in (clk),
      .clk_out(do4)
  );

  clks DB4_inst (
      .DIVISOR(DB4),
      .clk_in (clk),
      .clk_out(db4)
  );

  clks RE4_inst (
      .DIVISOR(RE4),
      .clk_in (clk),
      .clk_out(re4)
  );

  clks EB4_inst (
      .DIVISOR(EB4),
      .clk_in (clk),
      .clk_out(eb4)
  );

  clks MI4_inst (
      .DIVISOR(MI4),
      .clk_in (clk),
      .clk_out(mi4)
  );

  clks FA4_inst (
      .DIVISOR(FA4),
      .clk_in (clk),
      .clk_out(fa4)
  );

  clks GB4_inst (
      .DIVISOR(GB4),
      .clk_in (clk),
      .clk_out(gb4)
  );

  clks SOL4_inst (
      .DIVISOR(SOL4),
      .clk_in (clk),
      .clk_out(sol4)
  );

  clks AB4_inst (
      .DIVISOR(AB4),
      .clk_in (clk),
      .clk_out(ab4)
  );

  clks LA4_inst (
      .DIVISOR(LA4),
      .clk_in (clk),
      .clk_out(la4)
  );

  clks BB4_inst (
      .DIVISOR(BB4),
      .clk_in (clk),
      .clk_out(bb4)
  );

  clks SI4_inst (
      .DIVISOR(SI4),
      .clk_in (clk),
      .clk_out(si4)
  );

  // Quinta octava
  clks DO5_inst (
      .DIVISOR(DO5),
      .clk_in (clk),
      .clk_out(do5)
  );

  clks DB5_inst (
      .DIVISOR(DB5),
      .clk_in (clk),
      .clk_out(db5)
  );

  clks RE5_inst (
      .DIVISOR(RE5),
      .clk_in (clk),
      .clk_out(re5)
  );

  clks EB5_inst (
      .DIVISOR(EB5),
      .clk_in (clk),
      .clk_out(eb5)
  );

  clks MI5_inst (
      .DIVISOR(MI5),
      .clk_in (clk),
      .clk_out(mi5)
  );

  clks FA5_inst (
      .DIVISOR(FA5),
      .clk_in (clk),
      .clk_out(fa5)
  );

  clks GB5_inst (
      .DIVISOR(GB5),
      .clk_in (clk),
      .clk_out(gb5)
  );

  clks SOL5_inst (
      .DIVISOR(SOL5),
      .clk_in (clk),
      .clk_out(sol5)
  );

  clks AB5_inst (
      .DIVISOR(AB5),
      .clk_in (clk),
      .clk_out(ab5)
  );

  clks LA5_inst (
      .DIVISOR(LA5),
      .clk_in (clk),
      .clk_out(la5)
  );

  clks BB5_inst (
      .DIVISOR(BB5),
      .clk_in (clk),
      .clk_out(bb5)
  );

  clks SI5_inst (
      .DIVISOR(SI5),
      .clk_in (clk),
      .clk_out(si5)
  );

  always @(*) begin
    case (conteo)
      8'd0:  musica <= 1'd0;
      8'd1:  musica <= sol4;
      8'd2:  musica <= sol4;
      8'd3:  musica <= sol4;
      8'd4:  musica <= sol4;
      8'd5:  musica <= 1'd0;
      8'd6:  musica <= do4;
      8'd7:  musica <= do4;
      8'd8:  musica <= do4;
      8'd9:  musica <= do4;
      8'd10: musica <= 1'd0;
      8'd11: musica <= la4;
      8'd12: musica <= la4;
      8'd13: musica <= la4;
      8'd14: musica <= la4;
      8'd15: musica <= 1'd0;
      8'd16: musica <= do5;
      8'd17: musica <= do5;
      8'd18: musica <= do5;
      8'd19: musica <= do5;
      8'd20: musica <= 1'd0;
      8'd21: musica <= 1'd0;
      8'd22: musica <= 1'd0;
      8'd23: musica <= 1'd0;
      8'd24: musica <= 1'd0;
      8'd25: musica <= 1'd0;

      8'd26: musica <= 1'd0;
      8'd27: musica <= sol4;
      8'd28: musica <= sol4;
      8'd29: musica <= sol4;
      8'd30: musica <= sol4;
      8'd31: musica <= 1'd0;
      8'd32: musica <= do4;
      8'd33: musica <= do4;
      8'd34: musica <= do4;
      8'd35: musica <= do4;
      8'd36: musica <= 1'd0;
      8'd37: musica <= la4;
      8'd38: musica <= la4;
      8'd39: musica <= la4;
      8'd40: musica <= la4;
      8'd41: musica <= 1'd0;
      8'd42: musica <= do5;
      8'd43: musica <= do5;
      8'd44: musica <= do5;
      8'd45: musica <= do5;
      8'd46: musica <= 1'd0;
      8'd47: musica <= 1'd0;
      8'd48: musica <= 1'd0;
      8'd49: musica <= 1'd0;
      8'd50: musica <= 1'd0;
      8'd51: musica <= 1'd0;

      8'd52: musica <= 1'd0;
      8'd53: musica <= sol4;
      8'd54: musica <= sol4;
      8'd55: musica <= sol4;
      8'd56: musica <= sol4;
      8'd57: musica <= 1'd0;
      8'd58: musica <= do4;
      8'd59: musica <= do4;
      8'd60: musica <= do4;
      8'd61: musica <= do4;
      8'd62: musica <= 1'd0;
      8'd63: musica <= la4;
      8'd64: musica <= la4;
      8'd65: musica <= la4;
      8'd66: musica <= la4;
      8'd67: musica <= 1'd0;
      8'd68: musica <= do5;
      8'd69: musica <= do5;
      8'd70: musica <= do5;
      8'd71: musica <= do5;
      8'd72: musica <= 1'd0;
      8'd73: musica <= 1'd0;
      8'd74: musica <= 1'd0;
      8'd75: musica <= 1'd0;
      8'd76: musica <= 1'd0;
      8'd77: musica <= 1'd0;

      8'd78:  musica <= 1'd0;
      8'd79:  musica <= sol4;
      8'd80:  musica <= sol4;
      8'd81:  musica <= sol4;
      8'd82:  musica <= sol4;
      8'd83:  musica <= 1'd0;
      8'd84:  musica <= do4;
      8'd85:  musica <= do4;
      8'd86:  musica <= do4;
      8'd87:  musica <= do4;
      8'd88:  musica <= 1'd0;
      8'd89:  musica <= la4;
      8'd90:  musica <= la4;
      8'd91:  musica <= la4;
      8'd92:  musica <= la4;
      8'd93:  musica <= 1'd0;
      8'd94:  musica <= do5;
      8'd95:  musica <= do5;
      8'd96:  musica <= do5;
      8'd97:  musica <= do5;
      8'd98:  musica <= 1'd0;
      8'd99:  musica <= 1'd0;
      8'd100: musica <= 1'd0;
      8'd101: musica <= 1'd0;
      8'd102: musica <= 1'd0;
      8'd103: musica <= 1'd0;

      8'd104: musica <= 1'd0;
      8'd105: musica <= sol4;
      8'd106: musica <= sol4;
      8'd107: musica <= sol4;
      8'd108: musica <= sol4;
      8'd109: musica <= 1'd0;
      8'd110: musica <= do4;
      8'd111: musica <= do4;
      8'd112: musica <= do4;
      8'd113: musica <= do4;
      8'd114: musica <= 1'd0;
      8'd115: musica <= la4;
      8'd116: musica <= la4;
      8'd117: musica <= la4;
      8'd118: musica <= la4;
      8'd119: musica <= 1'd0;
      8'd120: musica <= do5;
      8'd121: musica <= do5;
      8'd122: musica <= do5;
      8'd123: musica <= do5;
      8'd124: musica <= 1'd0;
      8'd125: musica <= 1'd0;
      8'd126: musica <= 1'd0;
      8'd127: musica <= 1'd0;
      8'd128: musica <= 1'd0;
      8'd129: musica <= 1'd0;

      8'd130: musica <= 1'd0;
      8'd131: musica <= sol4;
      8'd132: musica <= sol4;
      8'd133: musica <= sol4;
      8'd134: musica <= sol4;
      8'd135: musica <= 1'd0;
      8'd136: musica <= do4;
      8'd137: musica <= do4;
      8'd138: musica <= do4;
      8'd139: musica <= do4;
      8'd140: musica <= 1'd0;
      8'd141: musica <= la4;
      8'd142: musica <= la4;
      8'd143: musica <= la4;
      8'd144: musica <= la4;
      8'd145: musica <= 1'd0;
      8'd146: musica <= do5;
      8'd147: musica <= do5;
      8'd148: musica <= do5;
      8'd149: musica <= do5;
      8'd150: musica <= 1'd0;
      8'd151: musica <= 1'd0;
      8'd152: musica <= 1'd0;
      8'd153: musica <= 1'd0;
      8'd154: musica <= 1'd0;
      8'd155: musica <= 1'd0;

      8'd156: musica <= 1'd0;
      8'd157: musica <= sol4;
      8'd158: musica <= sol4;
      8'd159: musica <= sol4;
      8'd160: musica <= sol4;
      8'd161: musica <= 1'd0;
      8'd162: musica <= do4;
      8'd163: musica <= do4;
      8'd164: musica <= do4;
      8'd165: musica <= do4;
      8'd166: musica <= 1'd0;
      8'd167: musica <= la4;
      8'd168: musica <= la4;
      8'd169: musica <= la4;
      8'd170: musica <= la4;
      8'd171: musica <= 1'd0;
      8'd172: musica <= do5;
      8'd173: musica <= do5;
      8'd174: musica <= do5;
      8'd175: musica <= do5;
      8'd176: musica <= 1'd0;
      8'd177: musica <= 1'd0;
      8'd178: musica <= 1'd0;
      8'd179: musica <= 1'd0;
      8'd180: musica <= 1'd0;
      8'd181: musica <= 1'd0;

      8'd182: musica <= 1'd0;
      8'd183: musica <= sol4;
      8'd184: musica <= sol4;
      8'd185: musica <= sol4;
      8'd186: musica <= sol4;
      8'd187: musica <= 1'd0;
      8'd188: musica <= do4;
      8'd189: musica <= do4;
      8'd190: musica <= do4;
      8'd191: musica <= do4;
      8'd192: musica <= 1'd0;
      8'd193: musica <= la4;
      8'd194: musica <= la4;
      8'd195: musica <= la4;
      8'd196: musica <= la4;
      8'd197: musica <= 1'd0;
      8'd198: musica <= do5;
      8'd199: musica <= do5;
      8'd200: musica <= do5;
      8'd201: musica <= do5;
      8'd202: musica <= 1'd0;
      8'd203: musica <= 1'd0;
      8'd204: musica <= 1'd0;
      8'd205: musica <= 1'd0;
      8'd206: musica <= 1'd0;
      8'd207: musica <= 1'd0;

      8'd208: musica <= 1'd0;
      8'd209: musica <= sol4;
      8'd210: musica <= sol4;
      8'd211: musica <= sol4;
      8'd212: musica <= sol4;
      8'd213: musica <= 1'd0;
      8'd214: musica <= do4;
      8'd215: musica <= do4;
      8'd216: musica <= do4;
      8'd217: musica <= do4;
      8'd218: musica <= 1'd0;
      8'd219: musica <= la4;
      8'd220: musica <= la4;
      8'd221: musica <= la4;
      8'd222: musica <= la4;
      8'd223: musica <= 1'd0;
      8'd224: musica <= do5;
      8'd225: musica <= do5;
      8'd226: musica <= do5;
      8'd227: musica <= do5;
      8'd228: musica <= 1'd0;
      8'd229: musica <= 1'd0;
      8'd230: musica <= 1'd0;
      8'd231: musica <= 1'd0;
      8'd232: musica <= 1'd0;
      8'd233: musica <= 1'd0;

      8'd234: musica <= 1'd0;
      8'd235: musica <= sol4;
      8'd236: musica <= sol4;
      8'd237: musica <= sol4;
      8'd238: musica <= sol4;
      8'd239: musica <= 1'd0;
      8'd240: musica <= do4;

      default: musica <= 1'd0;  // Valor por defecto
    endcase
  end
endmodule


module notas_Mario (
    input clk,
    input [1:0] estado,
    output reg musica
);

  /*Frecuencias de las Notas en la Octava C4 (4ta Octava)
C4 (Do): 261.63 Hz
C#4 / Db4 (Do# / Re♭): 277.18 Hz
D4 (Re): 293.66 Hz
D#4 / Eb4 (Re# / Mi♭): 311.13 Hz
E4 (Mi): 329.63 Hz
F4 (Fa): 349.23 Hz
F#4 / Gb4 (Fa# / Sol♭): 369.99 Hz
G4 (Sol): 392.00 Hz
G#4 / Ab4 (Sol# / La♭): 415.30 Hz
A4 (La): 440.00 Hz
A#4 / Bb4 (La# / Si♭): 466.16 Hz
B4 (Si): 493.88 Hz
Frecuencias de las Notas en la Octava C5 (5ta Octava)
C5 (Do): 523.25 Hz
C#5 / Db5 (Do# / Re♭): 554.37 Hz
D5 (Re): 587.33 Hz
D#5 / Eb5 (Re# / Mi♭): 622.25 Hz
E5 (Mi): 659.25 Hz
F5 (Fa): 698.46 Hz
F#5 / Gb5 (Fa# / Sol♭): 739.99 Hz
G5 (Sol): 783.99 Hz
G#5 / Ab5 (Sol# / La♭): 830.61 Hz
A5 (La): 880.00 Hz
A#5 / Bb5 (La# / Si♭): 932.33 Hz
B5 (Si): 987.77 Hz*/

  parameter [28:0] divider = 1_687_500;
  reg clk_out;
  reg [28:0] counter = 26'd0;
  reg [7:0] conteo = 8'd0;

  always @(posedge clk) begin
    counter <= counter + 29'd1;
    if (counter >= (divider - 1)) counter <= 29'd0;
    clk_out <= (counter <= divider / 2) ? 1'b1 : 1'b0;
  end  ///clock divider 16 hz

  always @(posedge clk_out) begin
    conteo <= 8'd0;
    if (estado == 1'd1) begin
      conteo <= conteo + 8'd1;
    end else if (conteo > 8'd240) begin
      conteo <= 8'd0;
    end else conteo <= conteo + 8'd1;
  end  //contador para cambio de notas y melodias


  parameter DO4 = 29'd103_053;  // 261.95 Hz
  parameter DB4 = 29'd97_473;  // 276.96 Hz
  parameter RE4 = 29'd91_837;  // 294.07 Hz
  parameter EB4 = 29'd86_817;  // 310.98 Hz
  parameter MI4 = 29'd81_818;  // 330.00 Hz
  parameter FA4 = 29'd77_364;  // 348.82 Hz
  parameter GB4 = 29'd72_973;  // 369.99 Hz
  parameter SOL4 = 29'd68_877;  // 392.00 Hz
  parameter AB4 = 29'd65_060;  // 415.30 Hz
  parameter LA4 = 29'd61_364;  // 439.99 Hz
  parameter BB4 = 29'd57_920;  // 466.16 Hz
  parameter SI4 = 29'd54_669;  // 493.88 Hz

  // Quinta octava
  parameter DO5 = 29'd51_600;  // 523.26 Hz
  parameter DB5 = 29'd48_704;  // 554.37 Hz
  parameter RE5 = 29'd45_971;  // 586.93 Hz
  parameter EB5 = 29'd43_391;  // 622.02 Hz
  parameter MI5 = 29'd40_956;  // 659.25 Hz
  parameter FA5 = 29'd38_656;  // 697.64 Hz
  parameter GB5 = 29'd36_487;  // 739.98 Hz
  parameter SOL5 = 29'd34_439;  // 784.00 Hz
  parameter AB5 = 29'd32_506;  // 830.60 Hz
  parameter LA5 = 29'd30_682;  // 879.99 Hz
  parameter BB5 = 29'd28_960;  // 932.32 Hz
  parameter SI5 = 29'd27_334;  // 987.77 Hz

  // Instanciaciones
  clks DO4_inst (
      .DIVISOR(DO4),
      .clk_in (clk),
      .clk_out(do4)
  );

  clks DB4_inst (
      .DIVISOR(DB4),
      .clk_in (clk),
      .clk_out(db4)
  );

  clks RE4_inst (
      .DIVISOR(RE4),
      .clk_in (clk),
      .clk_out(re4)
  );

  clks EB4_inst (
      .DIVISOR(EB4),
      .clk_in (clk),
      .clk_out(eb4)
  );

  clks MI4_inst (
      .DIVISOR(MI4),
      .clk_in (clk),
      .clk_out(mi4)
  );

  clks FA4_inst (
      .DIVISOR(FA4),
      .clk_in (clk),
      .clk_out(fa4)
  );

  clks GB4_inst (
      .DIVISOR(GB4),
      .clk_in (clk),
      .clk_out(gb4)
  );

  clks SOL4_inst (
      .DIVISOR(SOL4),
      .clk_in (clk),
      .clk_out(sol4)
  );

  clks AB4_inst (
      .DIVISOR(AB4),
      .clk_in (clk),
      .clk_out(ab4)
  );

  clks LA4_inst (
      .DIVISOR(LA4),
      .clk_in (clk),
      .clk_out(la4)
  );

  clks BB4_inst (
      .DIVISOR(BB4),
      .clk_in (clk),
      .clk_out(bb4)
  );

  clks SI4_inst (
      .DIVISOR(SI4),
      .clk_in (clk),
      .clk_out(si4)
  );

  // Quinta octava
  clks DO5_inst (
      .DIVISOR(DO5),
      .clk_in (clk),
      .clk_out(do5)
  );

  clks DB5_inst (
      .DIVISOR(DB5),
      .clk_in (clk),
      .clk_out(db5)
  );

  clks RE5_inst (
      .DIVISOR(RE5),
      .clk_in (clk),
      .clk_out(re5)
  );

  clks EB5_inst (
      .DIVISOR(EB5),
      .clk_in (clk),
      .clk_out(eb5)
  );

  clks MI5_inst (
      .DIVISOR(MI5),
      .clk_in (clk),
      .clk_out(mi5)
  );

  clks FA5_inst (
      .DIVISOR(FA5),
      .clk_in (clk),
      .clk_out(fa5)
  );

  clks GB5_inst (
      .DIVISOR(GB5),
      .clk_in (clk),
      .clk_out(gb5)
  );

  clks SOL5_inst (
      .DIVISOR(SOL5),
      .clk_in (clk),
      .clk_out(sol5)
  );

  clks AB5_inst (
      .DIVISOR(AB5),
      .clk_in (clk),
      .clk_out(ab5)
  );

  clks LA5_inst (
      .DIVISOR(LA5),
      .clk_in (clk),
      .clk_out(la5)
  );

  clks BB5_inst (
      .DIVISOR(BB5),
      .clk_in (clk),
      .clk_out(bb5)
  );

  clks SI5_inst (
      .DIVISOR(SI5),
      .clk_in (clk),
      .clk_out(si5)
  );

  always @(*) begin
    case (conteo)
      8'd0:  musica <= mi4;
      8'd1:  musica <= mi4;
      8'd2:  musica <= sol4;
      8'd3:  musica <= sol4;
      8'd4:  musica <= 1'd0;
      8'd5:  musica <= do5;
      8'd6:  musica <= do5;
      8'd7:  musica <= sol4;
      8'd8:  musica <= sol4;
      8'd9:  musica <= 1'd0;
      8'd10: musica <= do5;
      8'd11: musica <= do5;
      8'd12: musica <= mi5;
      8'd13: musica <= mi5;
      8'd14: musica <= 1'd0;

      8'd15: musica <= mi4;
      8'd16: musica <= mi4;
      8'd17: musica <= sol4;
      8'd18: musica <= sol4;
      8'd19: musica <= 1'd0;
      8'd20: musica <= do5;
      8'd21: musica <= do5;
      8'd22: musica <= sol4;
      8'd23: musica <= sol4;
      8'd24: musica <= 1'd0;
      8'd25: musica <= do5;
      8'd26: musica <= do5;
      8'd27: musica <= mi5;
      8'd28: musica <= mi5;
      8'd29: musica <= 1'd0;

      8'd30: musica <= mi4;
      8'd31: musica <= mi4;
      8'd32: musica <= sol4;
      8'd33: musica <= sol4;
      8'd34: musica <= 1'd0;
      8'd35: musica <= do5;
      8'd36: musica <= do5;
      8'd37: musica <= sol4;
      8'd38: musica <= sol4;
      8'd39: musica <= 1'd0;
      8'd40: musica <= do5;
      8'd41: musica <= do5;
      8'd42: musica <= mi5;
      8'd43: musica <= mi5;
      8'd44: musica <= 1'd0;

      8'd45: musica <= mi4;
      8'd46: musica <= mi4;
      8'd47: musica <= sol4;
      8'd48: musica <= sol4;
      8'd49: musica <= 1'd0;
      8'd50: musica <= do5;
      8'd51: musica <= do5;
      8'd52: musica <= sol4;
      8'd53: musica <= sol4;
      8'd54: musica <= 1'd0;
      8'd55: musica <= do5;
      8'd56: musica <= do5;
      8'd57: musica <= mi5;
      8'd58: musica <= mi5;
      8'd59: musica <= 1'd0;

      8'd60: musica <= mi4;
      8'd61: musica <= mi4;
      8'd62: musica <= sol4;
      8'd63: musica <= sol4;
      8'd64: musica <= 1'd0;
      8'd65: musica <= do5;
      8'd66: musica <= do5;
      8'd67: musica <= sol4;
      8'd68: musica <= sol4;
      8'd69: musica <= 1'd0;
      8'd70: musica <= do5;
      8'd71: musica <= do5;
      8'd72: musica <= mi5;
      8'd73: musica <= mi5;
      8'd74: musica <= 1'd0;

      8'd75: musica <= mi4;
      8'd76: musica <= mi4;
      8'd77: musica <= sol4;
      8'd78: musica <= sol4;
      8'd79: musica <= 1'd0;
      8'd80: musica <= do5;
      8'd81: musica <= do5;
      8'd82: musica <= sol4;
      8'd83: musica <= sol4;
      8'd84: musica <= 1'd0;
      8'd85: musica <= do5;
      8'd86: musica <= do5;
      8'd87: musica <= mi5;
      8'd88: musica <= mi5;
      8'd89: musica <= 1'd0;

      8'd90:  musica <= mi4;
      8'd91:  musica <= mi4;
      8'd92:  musica <= sol4;
      8'd93:  musica <= sol4;
      8'd94:  musica <= 1'd0;
      8'd95:  musica <= do5;
      8'd96:  musica <= do5;
      8'd97:  musica <= sol4;
      8'd98:  musica <= sol4;
      8'd99:  musica <= 1'd0;
      8'd100: musica <= do5;
      8'd101: musica <= do5;
      8'd102: musica <= mi5;
      8'd103: musica <= mi5;
      8'd104: musica <= 1'd0;

      8'd105: musica <= mi4;
      8'd106: musica <= mi4;
      8'd107: musica <= sol4;
      8'd108: musica <= sol4;
      8'd109: musica <= 1'd0;
      8'd110: musica <= do5;
      8'd111: musica <= do5;
      8'd112: musica <= sol4;
      8'd113: musica <= sol4;
      8'd114: musica <= 1'd0;
      8'd115: musica <= do5;
      8'd116: musica <= do5;
      8'd117: musica <= mi5;
      8'd118: musica <= mi5;
      8'd119: musica <= 1'd0;

      8'd120: musica <= mi4;
      8'd121: musica <= mi4;
      8'd122: musica <= sol4;
      8'd123: musica <= sol4;
      8'd124: musica <= 1'd0;
      8'd125: musica <= do5;
      8'd126: musica <= do5;
      8'd127: musica <= sol4;
      8'd128: musica <= sol4;
      8'd129: musica <= 1'd0;
      8'd130: musica <= do5;
      8'd131: musica <= do5;
      8'd132: musica <= mi5;
      8'd133: musica <= mi5;
      8'd134: musica <= 1'd0;

      8'd135: musica <= mi4;
      8'd136: musica <= mi4;
      8'd137: musica <= sol4;
      8'd138: musica <= sol4;
      8'd139: musica <= 1'd0;
      8'd140: musica <= do5;
      8'd141: musica <= do5;
      8'd142: musica <= sol4;
      8'd143: musica <= sol4;
      8'd144: musica <= 1'd0;
      8'd145: musica <= do5;
      8'd146: musica <= do5;
      8'd147: musica <= mi5;
      8'd148: musica <= mi5;
      8'd149: musica <= 1'd0;

      8'd150: musica <= mi4;
      8'd151: musica <= mi4;
      8'd152: musica <= sol4;
      8'd153: musica <= sol4;
      8'd154: musica <= 1'd0;
      8'd155: musica <= do5;
      8'd156: musica <= do5;
      8'd157: musica <= sol4;
      8'd158: musica <= sol4;
      8'd159: musica <= 1'd0;
      8'd160: musica <= do5;
      8'd161: musica <= do5;
      8'd162: musica <= mi5;
      8'd163: musica <= mi5;
      8'd164: musica <= 1'd0;

      8'd165: musica <= mi4;
      8'd166: musica <= mi4;
      8'd167: musica <= sol4;
      8'd168: musica <= sol4;
      8'd169: musica <= 1'd0;
      8'd170: musica <= do5;
      8'd171: musica <= do5;
      8'd172: musica <= sol4;
      8'd173: musica <= sol4;
      8'd174: musica <= 1'd0;
      8'd175: musica <= do5;
      8'd176: musica <= do5;
      8'd177: musica <= mi5;
      8'd178: musica <= mi5;
      8'd179: musica <= 1'd0;

      8'd180: musica <= mi4;
      8'd181: musica <= mi4;
      8'd182: musica <= sol4;
      8'd183: musica <= sol4;
      8'd184: musica <= 1'd0;
      8'd185: musica <= do5;
      8'd186: musica <= do5;
      8'd187: musica <= sol4;
      8'd188: musica <= sol4;
      8'd189: musica <= 1'd0;
      8'd190: musica <= do5;
      8'd191: musica <= do5;
      8'd192: musica <= mi5;
      8'd193: musica <= mi5;
      8'd194: musica <= 1'd0;

      8'd195: musica <= mi4;
      8'd196: musica <= mi4;
      8'd197: musica <= sol4;
      8'd198: musica <= sol4;
      8'd199: musica <= 1'd0;
      8'd200: musica <= do5;
      8'd201: musica <= do5;
      8'd202: musica <= sol4;
      8'd203: musica <= sol4;
      8'd204: musica <= 1'd0;
      8'd205: musica <= do5;
      8'd206: musica <= do5;
      8'd207: musica <= mi5;
      8'd208: musica <= mi5;
      8'd209: musica <= 1'd0;

      8'd210: musica <= mi4;
      8'd211: musica <= mi4;
      8'd212: musica <= sol4;
      8'd213: musica <= sol4;
      8'd214: musica <= 1'd0;
      8'd215: musica <= do5;
      8'd216: musica <= do5;
      8'd217: musica <= sol4;
      8'd218: musica <= sol4;
      8'd219: musica <= 1'd0;
      8'd220: musica <= do5;
      8'd221: musica <= do5;
      8'd222: musica <= mi5;
      8'd223: musica <= mi5;
      8'd224: musica <= 1'd0;

      8'd225: musica <= mi4;
      8'd226: musica <= mi4;
      8'd227: musica <= sol4;
      8'd228: musica <= sol4;
      8'd229: musica <= 1'd0;
      8'd230: musica <= do5;
      8'd231: musica <= do5;
      8'd232: musica <= sol4;
      8'd233: musica <= sol4;
      8'd234: musica <= 1'd0;
      8'd235: musica <= do5;
      8'd236: musica <= do5;
      8'd237: musica <= mi5;
      8'd238: musica <= mi5;
      8'd239: musica <= 1'd0;

      8'd240: musica <= mi4;

      default: musica <= 1'd0;  // Valor por defecto
    endcase
  end
endmodule

module notas_tetriz (
    input clk,
    input [1:0] estado,
    output reg musica
);

  /*Frecuencias de las Notas en la Octava C4 (4ta Octava)
C4 (Do): 261.63 Hz
C#4 / Db4 (Do# / Re♭): 277.18 Hz
D4 (Re): 293.66 Hz
D#4 / Eb4 (Re# / Mi♭): 311.13 Hz
E4 (Mi): 329.63 Hz
F4 (Fa): 349.23 Hz
F#4 / Gb4 (Fa# / Sol♭): 369.99 Hz
G4 (Sol): 392.00 Hz
G#4 / Ab4 (Sol# / La♭): 415.30 Hz
A4 (La): 440.00 Hz
A#4 / Bb4 (La# / Si♭): 466.16 Hz
B4 (Si): 493.88 Hz
Frecuencias de las Notas en la Octava C5 (5ta Octava)
C5 (Do): 523.25 Hz
C#5 / Db5 (Do# / Re♭): 554.37 Hz
D5 (Re): 587.33 Hz
D#5 / Eb5 (Re# / Mi♭): 622.25 Hz
E5 (Mi): 659.25 Hz
F5 (Fa): 698.46 Hz
F#5 / Gb5 (Fa# / Sol♭): 739.99 Hz
G5 (Sol): 783.99 Hz
G#5 / Ab5 (Sol# / La♭): 830.61 Hz
A5 (La): 880.00 Hz
A#5 / Bb5 (La# / Si♭): 932.33 Hz
B5 (Si): 987.77 Hz*/

  parameter [28:0] divider = 1_687_500;
  reg clk_out;
  reg [28:0] counter = 26'd0;
  reg [7:0] conteo = 8'd0;

  always @(posedge clk) begin
    counter <= counter + 29'd1;
    if (counter >= (divider - 1)) counter <= 29'd0;
    clk_out <= (counter <= divider / 2) ? 1'b1 : 1'b0;
  end  ///clock divider 16 hz

  always @(posedge clk_out) begin
    conteo <= 8'd0;
    if (estado == 1'd1) begin
      conteo <= conteo + 8'd1;
    end else if (conteo > 8'd240) begin
      conteo <= 8'd0;
    end else conteo <= conteo + 8'd1;
  end  //contador para cambio de notas y melodias


  parameter DO4 = 29'd103_053;  // 261.95 Hz
  parameter DB4 = 29'd97_473;  // 276.96 Hz
  parameter RE4 = 29'd91_837;  // 294.07 Hz
  parameter EB4 = 29'd86_817;  // 310.98 Hz
  parameter MI4 = 29'd81_818;  // 330.00 Hz
  parameter FA4 = 29'd77_364;  // 348.82 Hz
  parameter GB4 = 29'd72_973;  // 369.99 Hz
  parameter SOL4 = 29'd68_877;  // 392.00 Hz
  parameter AB4 = 29'd65_060;  // 415.30 Hz
  parameter LA4 = 29'd61_364;  // 439.99 Hz
  parameter BB4 = 29'd57_920;  // 466.16 Hz
  parameter SI4 = 29'd54_669;  // 493.88 Hz

  // Quinta octava
  parameter DO5 = 29'd51_600;  // 523.26 Hz
  parameter DB5 = 29'd48_704;  // 554.37 Hz
  parameter RE5 = 29'd45_971;  // 586.93 Hz
  parameter EB5 = 29'd43_391;  // 622.02 Hz
  parameter MI5 = 29'd40_956;  // 659.25 Hz
  parameter FA5 = 29'd38_656;  // 697.64 Hz
  parameter GB5 = 29'd36_487;  // 739.98 Hz
  parameter SOL5 = 29'd34_439;  // 784.00 Hz
  parameter AB5 = 29'd32_506;  // 830.60 Hz
  parameter LA5 = 29'd30_682;  // 879.99 Hz
  parameter BB5 = 29'd28_960;  // 932.32 Hz
  parameter SI5 = 29'd27_334;  // 987.77 Hz

  // Instanciaciones
  clks DO4_inst (
      .DIVISOR(DO4),
      .clk_in (clk),
      .clk_out(do4)
  );

  clks DB4_inst (
      .DIVISOR(DB4),
      .clk_in (clk),
      .clk_out(db4)
  );

  clks RE4_inst (
      .DIVISOR(RE4),
      .clk_in (clk),
      .clk_out(re4)
  );

  clks EB4_inst (
      .DIVISOR(EB4),
      .clk_in (clk),
      .clk_out(eb4)
  );

  clks MI4_inst (
      .DIVISOR(MI4),
      .clk_in (clk),
      .clk_out(mi4)
  );

  clks FA4_inst (
      .DIVISOR(FA4),
      .clk_in (clk),
      .clk_out(fa4)
  );

  clks GB4_inst (
      .DIVISOR(GB4),
      .clk_in (clk),
      .clk_out(gb4)
  );

  clks SOL4_inst (
      .DIVISOR(SOL4),
      .clk_in (clk),
      .clk_out(sol4)
  );

  clks AB4_inst (
      .DIVISOR(AB4),
      .clk_in (clk),
      .clk_out(ab4)
  );

  clks LA4_inst (
      .DIVISOR(LA4),
      .clk_in (clk),
      .clk_out(la4)
  );

  clks BB4_inst (
      .DIVISOR(BB4),
      .clk_in (clk),
      .clk_out(bb4)
  );

  clks SI4_inst (
      .DIVISOR(SI4),
      .clk_in (clk),
      .clk_out(si4)
  );

  // Quinta octava
  clks DO5_inst (
      .DIVISOR(DO5),
      .clk_in (clk),
      .clk_out(do5)
  );

  clks DB5_inst (
      .DIVISOR(DB5),
      .clk_in (clk),
      .clk_out(db5)
  );

  clks RE5_inst (
      .DIVISOR(RE5),
      .clk_in (clk),
      .clk_out(re5)
  );

  clks EB5_inst (
      .DIVISOR(EB5),
      .clk_in (clk),
      .clk_out(eb5)
  );

  clks MI5_inst (
      .DIVISOR(MI5),
      .clk_in (clk),
      .clk_out(mi5)
  );

  clks FA5_inst (
      .DIVISOR(FA5),
      .clk_in (clk),
      .clk_out(fa5)
  );

  clks GB5_inst (
      .DIVISOR(GB5),
      .clk_in (clk),
      .clk_out(gb5)
  );

  clks SOL5_inst (
      .DIVISOR(SOL5),
      .clk_in (clk),
      .clk_out(sol5)
  );

  clks AB5_inst (
      .DIVISOR(AB5),
      .clk_in (clk),
      .clk_out(ab5)
  );

  clks LA5_inst (
      .DIVISOR(LA5),
      .clk_in (clk),
      .clk_out(la5)
  );

  clks BB5_inst (
      .DIVISOR(BB5),
      .clk_in (clk),
      .clk_out(bb5)
  );

  clks SI5_inst (
      .DIVISOR(SI5),
      .clk_in (clk),
      .clk_out(si5)
  );

  always @(*) begin
    case (conteo)
      8'd0:  musica <= la4;
      8'd1:  musica <= la4;
      8'd2:  musica <= la4;
      8'd3:  musica <= la4;
      8'd4:  musica <= sol4;
      8'd5:  musica <= sol4;
      8'd6:  musica <= sol4;
      8'd7:  musica <= sol4;
      8'd8:  musica <= gb4;
      8'd9:  musica <= gb4;
      8'd10: musica <= gb4;
      8'd11: musica <= gb4;
      8'd12: musica <= gb4;
      8'd13: musica <= gb4;
      8'd14: musica <= gb4;
      8'd15: musica <= gb4;
      8'd16: musica <= gb4;
      8'd17: musica <= 1'd0;
      8'd18: musica <= mi4;
      8'd19: musica <= mi4;
      8'd20: musica <= mi4;
      8'd21: musica <= mi4;
      8'd22: musica <= 1'd0;
      8'd23: musica <= 1'd0;
      8'd24: musica <= 1'd0;

      8'd25: musica <= la4;
      8'd26: musica <= la4;
      8'd27: musica <= la4;
      8'd28: musica <= la4;
      8'd29: musica <= sol4;
      8'd30: musica <= sol4;
      8'd31: musica <= sol4;
      8'd32: musica <= sol4;
      8'd33: musica <= gb4;
      8'd34: musica <= gb4;
      8'd35: musica <= gb4;
      8'd36: musica <= gb4;
      8'd37: musica <= gb4;
      8'd38: musica <= gb4;
      8'd39: musica <= gb4;
      8'd40: musica <= gb4;
      8'd41: musica <= gb4;
      8'd42: musica <= 1'd0;
      8'd43: musica <= mi4;
      8'd44: musica <= mi4;
      8'd45: musica <= mi4;
      8'd46: musica <= mi4;
      8'd47: musica <= 1'd0;
      8'd48: musica <= 1'd0;
      8'd49: musica <= 1'd0;

      8'd50: musica <= la4;
      8'd51: musica <= la4;
      8'd52: musica <= la4;
      8'd53: musica <= la4;
      8'd54: musica <= sol4;
      8'd55: musica <= sol4;
      8'd56: musica <= sol4;
      8'd57: musica <= sol4;
      8'd58: musica <= gb4;
      8'd59: musica <= gb4;
      8'd60: musica <= gb4;
      8'd61: musica <= gb4;
      8'd62: musica <= gb4;
      8'd63: musica <= gb4;
      8'd64: musica <= gb4;
      8'd65: musica <= gb4;
      8'd66: musica <= gb4;
      8'd67: musica <= 1'd0;
      8'd68: musica <= mi4;
      8'd69: musica <= mi4;
      8'd70: musica <= mi4;
      8'd71: musica <= mi4;
      8'd72: musica <= 1'd0;
      8'd73: musica <= 1'd0;
      8'd74: musica <= 1'd0;

      8'd75: musica <= la4;
      8'd76: musica <= la4;
      8'd77: musica <= la4;
      8'd78: musica <= la4;
      8'd79: musica <= sol4;
      8'd80: musica <= sol4;
      8'd81: musica <= sol4;
      8'd82: musica <= sol4;
      8'd83: musica <= gb4;
      8'd84: musica <= gb4;
      8'd85: musica <= gb4;
      8'd86: musica <= gb4;
      8'd87: musica <= gb4;
      8'd88: musica <= gb4;
      8'd89: musica <= gb4;
      8'd90: musica <= gb4;
      8'd91: musica <= gb4;
      8'd92: musica <= 1'd0;
      8'd93: musica <= mi4;
      8'd94: musica <= mi4;
      8'd95: musica <= mi4;
      8'd96: musica <= mi4;
      8'd97: musica <= 1'd0;
      8'd98: musica <= 1'd0;
      8'd99: musica <= 1'd0;

      8'd100: musica <= la4;
      8'd101: musica <= la4;
      8'd102: musica <= la4;
      8'd103: musica <= la4;
      8'd104: musica <= sol4;
      8'd105: musica <= sol4;
      8'd106: musica <= sol4;
      8'd107: musica <= sol4;
      8'd108: musica <= gb4;
      8'd109: musica <= gb4;
      8'd110: musica <= gb4;
      8'd111: musica <= gb4;
      8'd112: musica <= gb4;
      8'd113: musica <= gb4;
      8'd114: musica <= gb4;
      8'd115: musica <= gb4;
      8'd116: musica <= gb4;
      8'd117: musica <= 1'd0;
      8'd118: musica <= mi4;
      8'd119: musica <= mi4;
      8'd120: musica <= mi4;
      8'd121: musica <= mi4;
      8'd122: musica <= 1'd0;
      8'd123: musica <= 1'd0;
      8'd124: musica <= 1'd0;

      8'd125: musica <= la4;
      8'd126: musica <= la4;
      8'd127: musica <= la4;
      8'd128: musica <= la4;
      8'd129: musica <= sol4;
      8'd130: musica <= sol4;
      8'd131: musica <= sol4;
      8'd132: musica <= sol4;
      8'd133: musica <= gb4;
      8'd134: musica <= gb4;
      8'd135: musica <= gb4;
      8'd136: musica <= gb4;
      8'd137: musica <= gb4;
      8'd138: musica <= gb4;
      8'd139: musica <= gb4;
      8'd140: musica <= gb4;
      8'd141: musica <= gb4;
      8'd142: musica <= 1'd0;
      8'd143: musica <= mi4;
      8'd144: musica <= mi4;
      8'd145: musica <= mi4;
      8'd146: musica <= mi4;
      8'd147: musica <= 1'd0;
      8'd148: musica <= 1'd0;
      8'd149: musica <= 1'd0;

      8'd150: musica <= la4;
      8'd151: musica <= la4;
      8'd152: musica <= la4;
      8'd153: musica <= la4;
      8'd154: musica <= sol4;
      8'd155: musica <= sol4;
      8'd156: musica <= sol4;
      8'd157: musica <= sol4;
      8'd158: musica <= gb4;
      8'd159: musica <= gb4;
      8'd160: musica <= gb4;
      8'd161: musica <= gb4;
      8'd162: musica <= gb4;
      8'd163: musica <= gb4;
      8'd164: musica <= gb4;
      8'd165: musica <= gb4;
      8'd166: musica <= gb4;
      8'd167: musica <= 1'd0;
      8'd168: musica <= mi4;
      8'd169: musica <= mi4;
      8'd170: musica <= mi4;
      8'd171: musica <= mi4;
      8'd172: musica <= 1'd0;
      8'd173: musica <= 1'd0;
      8'd174: musica <= 1'd0;

      8'd175: musica <= la4;
      8'd176: musica <= la4;
      8'd177: musica <= la4;
      8'd178: musica <= la4;
      8'd179: musica <= sol4;
      8'd180: musica <= sol4;
      8'd181: musica <= sol4;
      8'd182: musica <= sol4;
      8'd183: musica <= gb4;
      8'd184: musica <= gb4;
      8'd185: musica <= gb4;
      8'd186: musica <= gb4;
      8'd187: musica <= gb4;
      8'd188: musica <= gb4;
      8'd189: musica <= gb4;
      8'd190: musica <= gb4;
      8'd191: musica <= gb4;
      8'd192: musica <= 1'd0;
      8'd193: musica <= mi4;
      8'd194: musica <= mi4;
      8'd195: musica <= mi4;
      8'd196: musica <= mi4;
      8'd197: musica <= 1'd0;
      8'd198: musica <= 1'd0;
      8'd199: musica <= 1'd0;

      8'd200: musica <= la4;
      8'd201: musica <= la4;
      8'd202: musica <= la4;
      8'd203: musica <= la4;
      8'd204: musica <= sol4;
      8'd205: musica <= sol4;
      8'd206: musica <= sol4;
      8'd207: musica <= sol4;
      8'd208: musica <= gb4;
      8'd209: musica <= gb4;
      8'd210: musica <= gb4;
      8'd211: musica <= gb4;
      8'd212: musica <= gb4;
      8'd213: musica <= gb4;
      8'd214: musica <= gb4;
      8'd215: musica <= gb4;
      8'd216: musica <= gb4;
      8'd217: musica <= 1'd0;
      8'd218: musica <= mi4;
      8'd219: musica <= mi4;
      8'd220: musica <= mi4;
      8'd221: musica <= mi4;
      8'd222: musica <= 1'd0;
      8'd223: musica <= 1'd0;
      8'd224: musica <= 1'd0;

      8'd225: musica <= la4;
      8'd226: musica <= la4;
      8'd227: musica <= la4;
      8'd228: musica <= la4;
      8'd229: musica <= sol4;
      8'd230: musica <= sol4;
      8'd231: musica <= sol4;
      8'd232: musica <= sol4;
      8'd233: musica <= gb4;
      8'd234: musica <= gb4;
      8'd235: musica <= gb4;
      8'd236: musica <= gb4;
      8'd237: musica <= gb4;
      8'd238: musica <= gb4;
      8'd239: musica <= gb4;
      8'd240: musica <= gb4;

      default: musica <= 1'd0;  // Valor por defecto
    endcase
  end
endmodule
