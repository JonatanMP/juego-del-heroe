module notas (
    input clk,
    input [1:0] estado,
    output reg muic1
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
    if ((estado == 1'd1)) begin
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

  wire do4, do5;
  wire db4, db5;
  wire re4, re5;
  wire eb4, eb5;
  wire mi4, mi5;
  wire fa4, fa5;
  wire gb4, gb5;
  wire sol4, sol5;
  wire ab4, ab5;
  wire la4, la5;
  wire bb4, bb5;
  wire si4, si5;

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
      8'd0: muic1 <= 1'd0;
      8'd1: muic1 <= do4;
      8'd2: muic1 <= do4;
      8'd3: muic1 <= do4;
      8'd4: muic1 <= do4;
      8'd5: muic1 <= 1'd0;
      8'd6: muic1 <= do4;
      8'd7: muic1 <= do4;
      8'd8: muic1 <= do4;
      8'd9: muic1 <= do4;
      8'd10: muic1 <= 1'd0;
      8'd11: muic1 <= fa4;
      8'd12: muic1 <= fa4;
      8'd13: muic1 <= fa4;
      8'd14: muic1 <= fa4;
      8'd15: muic1 <= fa4;
      8'd16: muic1 <= fa4;
      8'd17: muic1 <= fa4;
      8'd18: muic1 <= fa4;
      8'd19: muic1 <= fa4;
      8'd20: muic1 <= 1'd0;
      8'd21: muic1 <= 1'd0;
      8'd22: muic1 <= 1'd0;
      8'd23: muic1 <= 1'd0;
      8'd24: muic1 <= 1'd0;
      8'd25: muic1 <= 1'd0;
      8'd26: muic1 <= mi5;
      8'd27: muic1 <= mi5;
      8'd28: muic1 <= mi5;
      8'd29: muic1 <= mi5;
      8'd30: muic1 <= 1'd0;
      8'd31: muic1 <= re5;
      8'd32: muic1 <= re5;
      8'd33: muic1 <= re5;
      8'd34: muic1 <= re5;
      8'd35: muic1 <= 1'd0;
      8'd36: muic1 <= do5;
      8'd37: muic1 <= do5;
      8'd38: muic1 <= do5;
      8'd39: muic1 <= do5;
      8'd40: muic1 <= 1'd0;
      8'd41: muic1 <= re5;
      8'd42: muic1 <= re5;
      8'd43: muic1 <= re5;
      8'd44: muic1 <= re5;
      8'd45: muic1 <= re5;
      8'd46: muic1 <= re5;
      8'd47: muic1 <= re5;
      8'd48: muic1 <= re5;
      8'd49: muic1 <= re5;
      8'd50: muic1 <= re5;
      8'd51: muic1 <= re5;
      8'd52: muic1 <= re5;
      8'd53: muic1 <= re5;
      8'd54: muic1 <= re5;
      8'd55: muic1 <= 1'd0;
      8'd56: muic1 <= 1'd0;
      8'd57: muic1 <= 1'd0;
      8'd58: muic1 <= la4;
      8'd59: muic1 <= la4;
      8'd60: muic1 <= la4;
      8'd61: muic1 <= la4;
      8'd62: muic1 <= si4;
      8'd63: muic1 <= si4;
      8'd64: muic1 <= si4;
      8'd65: muic1 <= si4;
      8'd66: muic1 <= 1'd0;
      8'd67: muic1 <= do5;
      8'd68: muic1 <= do5;
      8'd69: muic1 <= do5;
      8'd70: muic1 <= do5;
      8'd71: muic1 <= do5;
      8'd72: muic1 <= do5;
      8'd73: muic1 <= do5;
      8'd74: muic1 <= do5;
      8'd75: muic1 <= do5;
      8'd76: muic1 <= do5;
      8'd77: muic1 <= do5;
      8'd78: muic1 <= do5;
      8'd79: muic1 <= do5;
      8'd80: muic1 <= 1'd0;
      8'd81: muic1 <= 1'd0;
      8'd82: muic1 <= 1'd0;
      8'd83: muic1 <= 1'd0;
      8'd84: muic1 <= do5;
      8'd85: muic1 <= do5;
      8'd86: muic1 <= do5;
      8'd87: muic1 <= do5;
      8'd88: muic1 <= do5;
      8'd89: muic1 <= do5;
      8'd90: muic1 <= do5;
      8'd91: muic1 <= do5;
      8'd92: muic1 <= do5;
      8'd93: muic1 <= 1'd0;
      8'd94: muic1 <= re5;
      8'd95: muic1 <= re5;
      8'd96: muic1 <= re5;
      8'd97: muic1 <= re5;
      8'd98: muic1 <= re5;
      8'd99: muic1 <= 1'd0;
      8'd100: muic1 <= do5;
      8'd101: muic1 <= do5;
      8'd102: muic1 <= do5;
      8'd103: muic1 <= do5;
      8'd104: muic1 <= do5;
      8'd105: muic1 <= 1'd0;
      8'd106: muic1 <= si4;
      8'd107: muic1 <= si4;
      8'd108: muic1 <= si4;
      8'd109: muic1 <= si4;
      8'd110: muic1 <= si4;
      8'd111: muic1 <= si4;
      8'd112: muic1 <= si4;
      8'd113: muic1 <= si4;
      8'd114: muic1 <= si4;
      8'd115: muic1 <= si4;
      8'd116: muic1 <= si4;
      8'd117: muic1 <= si4;
      8'd118: muic1 <= si4;
      8'd119: muic1 <= 1'd0;
      8'd120: muic1 <= 1'd0;
      8'd121: muic1 <= 1'd0;
      8'd122: muic1 <= 1'd0;
      8'd123: muic1 <= 1'd0;
      8'd124: muic1 <= do4;
      8'd125: muic1 <= do4;
      8'd126: muic1 <= do4;
      8'd127: muic1 <= do4;
      8'd128: muic1 <= 1'd0;
      8'd129: muic1 <= do4;
      8'd130: muic1 <= do4;
      8'd131: muic1 <= do4;
      8'd132: muic1 <= do4;
      8'd133: muic1 <= fa4;
      8'd134: muic1 <= fa4;
      8'd135: muic1 <= fa4;
      8'd136: muic1 <= fa4;
      8'd137: muic1 <= fa4;
      8'd138: muic1 <= fa4;
      8'd139: muic1 <= fa4;
      8'd140: muic1 <= fa4;
      8'd141: muic1 <= 1'd0;
      8'd142: muic1 <= 1'd0;
      8'd143: muic1 <= 1'd0;
      8'd144: muic1 <= 1'd0;
      8'd145: muic1 <= 1'd0;
      8'd146: muic1 <= 1'd0;
      8'd147: muic1 <= 1'd0;
      8'd148: muic1 <= 1'd0;
      8'd149: muic1 <= 1'd0;
      8'd150: muic1 <= 1'd0;
      8'd151: muic1 <= mi5;
      8'd152: muic1 <= mi5;
      8'd153: muic1 <= mi5;
      8'd154: muic1 <= mi5;
      8'd155: muic1 <= 1'd0;
      8'd156: muic1 <= re5;
      8'd157: muic1 <= re5;
      8'd158: muic1 <= re5;
      8'd159: muic1 <= re5;
      8'd160: muic1 <= 1'd0;
      8'd161: muic1 <= do5;
      8'd162: muic1 <= do5;
      8'd163: muic1 <= do5;
      8'd164: muic1 <= do5;
      8'd165: muic1 <= do5;
      8'd166: muic1 <= 1'd0;
      8'd167: muic1 <= re5;
      8'd168: muic1 <= re5;
      8'd169: muic1 <= re5;
      8'd170: muic1 <= re5;
      8'd171: muic1 <= re5;
      8'd172: muic1 <= re5;
      8'd173: muic1 <= re5;
      8'd174: muic1 <= re5;
      8'd175: muic1 <= re5;
      8'd176: muic1 <= re5;
      8'd177: muic1 <= re5;
      8'd178: muic1 <= re5;
      8'd179: muic1 <= re5;
      8'd180: muic1 <= re5;
      8'd181: muic1 <= 1'd0;
      8'd182: muic1 <= 1'd0;
      8'd183: muic1 <= 1'd0;
      8'd184: muic1 <= la4;
      8'd185: muic1 <= la4;
      8'd186: muic1 <= la4;
      8'd187: muic1 <= la4;
      8'd188: muic1 <= si4;
      8'd189: muic1 <= si4;
      8'd190: muic1 <= si4;
      8'd191: muic1 <= si4;
      8'd192: muic1 <= 1'd0;
      8'd193: muic1 <= do5;
      8'd194: muic1 <= do5;
      8'd195: muic1 <= do5;
      8'd196: muic1 <= do5;
      8'd197: muic1 <= do5;
      8'd198: muic1 <= do5;
      8'd199: muic1 <= do5;
      8'd200: muic1 <= do5;
      8'd201: muic1 <= do5;
      8'd202: muic1 <= do5;
      8'd203: muic1 <= do5;
      8'd204: muic1 <= do5;
      8'd205: muic1 <= do5;
      8'd206: muic1 <= 1'd0;
      8'd207: muic1 <= 1'd0;
      8'd208: muic1 <= 1'd0;
      8'd209: muic1 <= 1'd0;
      8'd210: muic1 <= 1'd0;
      8'd211: muic1 <= 1'd0;
      8'd212: muic1 <= do5;
      8'd213: muic1 <= do5;
      8'd214: muic1 <= do5;
      8'd215: muic1 <= do5;
      8'd216: muic1 <= do5;
      8'd217: muic1 <= do5;
      8'd218: muic1 <= do5;
      8'd219: muic1 <= 1'd0;
      8'd220: muic1 <= 1'd0;
      8'd221: muic1 <= si4;
      8'd222: muic1 <= si4;
      8'd223: muic1 <= si4;
      8'd224: muic1 <= si4;
      8'd225: muic1 <= si4;
      8'd226: muic1 <= si4;
      8'd227: muic1 <= si4;
      8'd228: muic1 <= si4;
      8'd229: muic1 <= si4;
      8'd230: muic1 <= si4;
      8'd231: muic1 <= la4;
      8'd232: muic1 <= la4;
      8'd233: muic1 <= la4;
      8'd234: muic1 <= la4;
      8'd235: muic1 <= la4;
      8'd236: muic1 <= la4;
      8'd237: muic1 <= la4;
      8'd238: muic1 <= la4;
      8'd239: muic1 <= la4;
      8'd240: muic1 <= la4;
      default: muic1 <= 1'd0;  // Valor por defecto
    endcase
  end
endmodule


/////////////////////////////////clk module ////////////////
module clks (
    input [28:0] DIVISOR,
    input clk_in,
    output reg clk_out
);

  reg [29:0] counter;
  always @(posedge clk_in) begin
    counter <= counter + 28'd1;
    if (counter >= (DIVISOR - 1)) counter <= 28'd0;
    clk_out <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
  end

endmodule
////////////////////////////////////////////////////////////

module notas_zelda (
    input clk,
    input [1:0] estado,
    output reg muic4
);

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

  wire do4, do5;
  wire db4, db5;
  wire re4, re5;
  wire eb4, eb5;
  wire mi4, mi5;
  wire fa4, fa5;
  wire gb4, gb5;
  wire sol4, sol5;
  wire ab4, ab5;
  wire la4, la5;
  wire bb4, bb5;
  wire si4, si5;

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
      8'd0:  muic4 <= 1'd0;
      8'd1:  muic4 <= sol4;
      8'd2:  muic4 <= sol4;
      8'd3:  muic4 <= sol4;
      8'd4:  muic4 <= sol4;
      8'd5:  muic4 <= 1'd0;
      8'd6:  muic4 <= do4;
      8'd7:  muic4 <= do4;
      8'd8:  muic4 <= do4;
      8'd9:  muic4 <= do4;
      8'd10: muic4 <= 1'd0;
      8'd11: muic4 <= la4;
      8'd12: muic4 <= la4;
      8'd13: muic4 <= la4;
      8'd14: muic4 <= la4;
      8'd15: muic4 <= 1'd0;
      8'd16: muic4 <= do5;
      8'd17: muic4 <= do5;
      8'd18: muic4 <= do5;
      8'd19: muic4 <= do5;
      8'd20: muic4 <= 1'd0;
      8'd21: muic4 <= 1'd0;
      8'd22: muic4 <= 1'd0;
      8'd23: muic4 <= 1'd0;
      8'd24: muic4 <= 1'd0;
      8'd25: muic4 <= 1'd0;

      8'd26: muic4 <= 1'd0;
      8'd27: muic4 <= sol4;
      8'd28: muic4 <= sol4;
      8'd29: muic4 <= sol4;
      8'd30: muic4 <= sol4;
      8'd31: muic4 <= 1'd0;
      8'd32: muic4 <= do4;
      8'd33: muic4 <= do4;
      8'd34: muic4 <= do4;
      8'd35: muic4 <= do4;
      8'd36: muic4 <= 1'd0;
      8'd37: muic4 <= la4;
      8'd38: muic4 <= la4;
      8'd39: muic4 <= la4;
      8'd40: muic4 <= la4;
      8'd41: muic4 <= 1'd0;
      8'd42: muic4 <= do5;
      8'd43: muic4 <= do5;
      8'd44: muic4 <= do5;
      8'd45: muic4 <= do5;
      8'd46: muic4 <= 1'd0;
      8'd47: muic4 <= 1'd0;
      8'd48: muic4 <= 1'd0;
      8'd49: muic4 <= 1'd0;
      8'd50: muic4 <= 1'd0;
      8'd51: muic4 <= 1'd0;

      8'd52: muic4 <= 1'd0;
      8'd53: muic4 <= sol4;
      8'd54: muic4 <= sol4;
      8'd55: muic4 <= sol4;
      8'd56: muic4 <= sol4;
      8'd57: muic4 <= 1'd0;
      8'd58: muic4 <= do4;
      8'd59: muic4 <= do4;
      8'd60: muic4 <= do4;
      8'd61: muic4 <= do4;
      8'd62: muic4 <= 1'd0;
      8'd63: muic4 <= la4;
      8'd64: muic4 <= la4;
      8'd65: muic4 <= la4;
      8'd66: muic4 <= la4;
      8'd67: muic4 <= 1'd0;
      8'd68: muic4 <= do5;
      8'd69: muic4 <= do5;
      8'd70: muic4 <= do5;
      8'd71: muic4 <= do5;
      8'd72: muic4 <= 1'd0;
      8'd73: muic4 <= 1'd0;
      8'd74: muic4 <= 1'd0;
      8'd75: muic4 <= 1'd0;
      8'd76: muic4 <= 1'd0;
      8'd77: muic4 <= 1'd0;

      8'd78:  muic4 <= 1'd0;
      8'd79:  muic4 <= sol4;
      8'd80:  muic4 <= sol4;
      8'd81:  muic4 <= sol4;
      8'd82:  muic4 <= sol4;
      8'd83:  muic4 <= 1'd0;
      8'd84:  muic4 <= do4;
      8'd85:  muic4 <= do4;
      8'd86:  muic4 <= do4;
      8'd87:  muic4 <= do4;
      8'd88:  muic4 <= 1'd0;
      8'd89:  muic4 <= la4;
      8'd90:  muic4 <= la4;
      8'd91:  muic4 <= la4;
      8'd92:  muic4 <= la4;
      8'd93:  muic4 <= 1'd0;
      8'd94:  muic4 <= do5;
      8'd95:  muic4 <= do5;
      8'd96:  muic4 <= do5;
      8'd97:  muic4 <= do5;
      8'd98:  muic4 <= 1'd0;
      8'd99:  muic4 <= 1'd0;
      8'd100: muic4 <= 1'd0;
      8'd101: muic4 <= 1'd0;
      8'd102: muic4 <= 1'd0;
      8'd103: muic4 <= 1'd0;

      8'd104: muic4 <= 1'd0;
      8'd105: muic4 <= sol4;
      8'd106: muic4 <= sol4;
      8'd107: muic4 <= sol4;
      8'd108: muic4 <= sol4;
      8'd109: muic4 <= 1'd0;
      8'd110: muic4 <= do4;
      8'd111: muic4 <= do4;
      8'd112: muic4 <= do4;
      8'd113: muic4 <= do4;
      8'd114: muic4 <= 1'd0;
      8'd115: muic4 <= la4;
      8'd116: muic4 <= la4;
      8'd117: muic4 <= la4;
      8'd118: muic4 <= la4;
      8'd119: muic4 <= 1'd0;
      8'd120: muic4 <= do5;
      8'd121: muic4 <= do5;
      8'd122: muic4 <= do5;
      8'd123: muic4 <= do5;
      8'd124: muic4 <= 1'd0;
      8'd125: muic4 <= 1'd0;
      8'd126: muic4 <= 1'd0;
      8'd127: muic4 <= 1'd0;
      8'd128: muic4 <= 1'd0;
      8'd129: muic4 <= 1'd0;

      8'd130: muic4 <= 1'd0;
      8'd131: muic4 <= sol4;
      8'd132: muic4 <= sol4;
      8'd133: muic4 <= sol4;
      8'd134: muic4 <= sol4;
      8'd135: muic4 <= 1'd0;
      8'd136: muic4 <= do4;
      8'd137: muic4 <= do4;
      8'd138: muic4 <= do4;
      8'd139: muic4 <= do4;
      8'd140: muic4 <= 1'd0;
      8'd141: muic4 <= la4;
      8'd142: muic4 <= la4;
      8'd143: muic4 <= la4;
      8'd144: muic4 <= la4;
      8'd145: muic4 <= 1'd0;
      8'd146: muic4 <= do5;
      8'd147: muic4 <= do5;
      8'd148: muic4 <= do5;
      8'd149: muic4 <= do5;
      8'd150: muic4 <= 1'd0;
      8'd151: muic4 <= 1'd0;
      8'd152: muic4 <= 1'd0;
      8'd153: muic4 <= 1'd0;
      8'd154: muic4 <= 1'd0;
      8'd155: muic4 <= 1'd0;

      8'd156: muic4 <= 1'd0;
      8'd157: muic4 <= sol4;
      8'd158: muic4 <= sol4;
      8'd159: muic4 <= sol4;
      8'd160: muic4 <= sol4;
      8'd161: muic4 <= 1'd0;
      8'd162: muic4 <= do4;
      8'd163: muic4 <= do4;
      8'd164: muic4 <= do4;
      8'd165: muic4 <= do4;
      8'd166: muic4 <= 1'd0;
      8'd167: muic4 <= la4;
      8'd168: muic4 <= la4;
      8'd169: muic4 <= la4;
      8'd170: muic4 <= la4;
      8'd171: muic4 <= 1'd0;
      8'd172: muic4 <= do5;
      8'd173: muic4 <= do5;
      8'd174: muic4 <= do5;
      8'd175: muic4 <= do5;
      8'd176: muic4 <= 1'd0;
      8'd177: muic4 <= 1'd0;
      8'd178: muic4 <= 1'd0;
      8'd179: muic4 <= 1'd0;
      8'd180: muic4 <= 1'd0;
      8'd181: muic4 <= 1'd0;

      8'd182: muic4 <= 1'd0;
      8'd183: muic4 <= sol4;
      8'd184: muic4 <= sol4;
      8'd185: muic4 <= sol4;
      8'd186: muic4 <= sol4;
      8'd187: muic4 <= 1'd0;
      8'd188: muic4 <= do4;
      8'd189: muic4 <= do4;
      8'd190: muic4 <= do4;
      8'd191: muic4 <= do4;
      8'd192: muic4 <= 1'd0;
      8'd193: muic4 <= la4;
      8'd194: muic4 <= la4;
      8'd195: muic4 <= la4;
      8'd196: muic4 <= la4;
      8'd197: muic4 <= 1'd0;
      8'd198: muic4 <= do5;
      8'd199: muic4 <= do5;
      8'd200: muic4 <= do5;
      8'd201: muic4 <= do5;
      8'd202: muic4 <= 1'd0;
      8'd203: muic4 <= 1'd0;
      8'd204: muic4 <= 1'd0;
      8'd205: muic4 <= 1'd0;
      8'd206: muic4 <= 1'd0;
      8'd207: muic4 <= 1'd0;

      8'd208: muic4 <= 1'd0;
      8'd209: muic4 <= sol4;
      8'd210: muic4 <= sol4;
      8'd211: muic4 <= sol4;
      8'd212: muic4 <= sol4;
      8'd213: muic4 <= 1'd0;
      8'd214: muic4 <= do4;
      8'd215: muic4 <= do4;
      8'd216: muic4 <= do4;
      8'd217: muic4 <= do4;
      8'd218: muic4 <= 1'd0;
      8'd219: muic4 <= la4;
      8'd220: muic4 <= la4;
      8'd221: muic4 <= la4;
      8'd222: muic4 <= la4;
      8'd223: muic4 <= 1'd0;
      8'd224: muic4 <= do5;
      8'd225: muic4 <= do5;
      8'd226: muic4 <= do5;
      8'd227: muic4 <= do5;
      8'd228: muic4 <= 1'd0;
      8'd229: muic4 <= 1'd0;
      8'd230: muic4 <= 1'd0;
      8'd231: muic4 <= 1'd0;
      8'd232: muic4 <= 1'd0;
      8'd233: muic4 <= 1'd0;

      8'd234: muic4 <= 1'd0;
      8'd235: muic4 <= sol4;
      8'd236: muic4 <= sol4;
      8'd237: muic4 <= sol4;
      8'd238: muic4 <= sol4;
      8'd239: muic4 <= 1'd0;
      8'd240: muic4 <= do4;

      default: muic4 <= 1'd0;  // Valor por defecto
    endcase
  end
endmodule


module notas_Mario (
    input clk,
    input [1:0] estado,
    output reg muic2
);

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

  wire do4, do5;
  wire db4, db5;
  wire re4, re5;
  wire eb4, eb5;
  wire mi4, mi5;
  wire fa4, fa5;
  wire gb4, gb5;
  wire sol4, sol5;
  wire ab4, ab5;
  wire la4, la5;
  wire bb4, bb5;
  wire si4, si5;

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
      8'd0:  muic2 <= mi4;
      8'd1:  muic2 <= mi4;
      8'd2:  muic2 <= sol4;
      8'd3:  muic2 <= sol4;
      8'd4:  muic2 <= 1'd0;
      8'd5:  muic2 <= do5;
      8'd6:  muic2 <= do5;
      8'd7:  muic2 <= sol4;
      8'd8:  muic2 <= sol4;
      8'd9:  muic2 <= 1'd0;
      8'd10: muic2 <= do5;
      8'd11: muic2 <= do5;
      8'd12: muic2 <= mi5;
      8'd13: muic2 <= mi5;
      8'd14: muic2 <= 1'd0;

      8'd15: muic2 <= mi4;
      8'd16: muic2 <= mi4;
      8'd17: muic2 <= sol4;
      8'd18: muic2 <= sol4;
      8'd19: muic2 <= 1'd0;
      8'd20: muic2 <= do5;
      8'd21: muic2 <= do5;
      8'd22: muic2 <= sol4;
      8'd23: muic2 <= sol4;
      8'd24: muic2 <= 1'd0;
      8'd25: muic2 <= do5;
      8'd26: muic2 <= do5;
      8'd27: muic2 <= mi5;
      8'd28: muic2 <= mi5;
      8'd29: muic2 <= 1'd0;

      8'd30: muic2 <= mi4;
      8'd31: muic2 <= mi4;
      8'd32: muic2 <= sol4;
      8'd33: muic2 <= sol4;
      8'd34: muic2 <= 1'd0;
      8'd35: muic2 <= do5;
      8'd36: muic2 <= do5;
      8'd37: muic2 <= sol4;
      8'd38: muic2 <= sol4;
      8'd39: muic2 <= 1'd0;
      8'd40: muic2 <= do5;
      8'd41: muic2 <= do5;
      8'd42: muic2 <= mi5;
      8'd43: muic2 <= mi5;
      8'd44: muic2 <= 1'd0;

      8'd45: muic2 <= mi4;
      8'd46: muic2 <= mi4;
      8'd47: muic2 <= sol4;
      8'd48: muic2 <= sol4;
      8'd49: muic2 <= 1'd0;
      8'd50: muic2 <= do5;
      8'd51: muic2 <= do5;
      8'd52: muic2 <= sol4;
      8'd53: muic2 <= sol4;
      8'd54: muic2 <= 1'd0;
      8'd55: muic2 <= do5;
      8'd56: muic2 <= do5;
      8'd57: muic2 <= mi5;
      8'd58: muic2 <= mi5;
      8'd59: muic2 <= 1'd0;

      8'd60: muic2 <= mi4;
      8'd61: muic2 <= mi4;
      8'd62: muic2 <= sol4;
      8'd63: muic2 <= sol4;
      8'd64: muic2 <= 1'd0;
      8'd65: muic2 <= do5;
      8'd66: muic2 <= do5;
      8'd67: muic2 <= sol4;
      8'd68: muic2 <= sol4;
      8'd69: muic2 <= 1'd0;
      8'd70: muic2 <= do5;
      8'd71: muic2 <= do5;
      8'd72: muic2 <= mi5;
      8'd73: muic2 <= mi5;
      8'd74: muic2 <= 1'd0;

      8'd75: muic2 <= mi4;
      8'd76: muic2 <= mi4;
      8'd77: muic2 <= sol4;
      8'd78: muic2 <= sol4;
      8'd79: muic2 <= 1'd0;
      8'd80: muic2 <= do5;
      8'd81: muic2 <= do5;
      8'd82: muic2 <= sol4;
      8'd83: muic2 <= sol4;
      8'd84: muic2 <= 1'd0;
      8'd85: muic2 <= do5;
      8'd86: muic2 <= do5;
      8'd87: muic2 <= mi5;
      8'd88: muic2 <= mi5;
      8'd89: muic2 <= 1'd0;

      8'd90:  muic2 <= mi4;
      8'd91:  muic2 <= mi4;
      8'd92:  muic2 <= sol4;
      8'd93:  muic2 <= sol4;
      8'd94:  muic2 <= 1'd0;
      8'd95:  muic2 <= do5;
      8'd96:  muic2 <= do5;
      8'd97:  muic2 <= sol4;
      8'd98:  muic2 <= sol4;
      8'd99:  muic2 <= 1'd0;
      8'd100: muic2 <= do5;
      8'd101: muic2 <= do5;
      8'd102: muic2 <= mi5;
      8'd103: muic2 <= mi5;
      8'd104: muic2 <= 1'd0;

      8'd105: muic2 <= mi4;
      8'd106: muic2 <= mi4;
      8'd107: muic2 <= sol4;
      8'd108: muic2 <= sol4;
      8'd109: muic2 <= 1'd0;
      8'd110: muic2 <= do5;
      8'd111: muic2 <= do5;
      8'd112: muic2 <= sol4;
      8'd113: muic2 <= sol4;
      8'd114: muic2 <= 1'd0;
      8'd115: muic2 <= do5;
      8'd116: muic2 <= do5;
      8'd117: muic2 <= mi5;
      8'd118: muic2 <= mi5;
      8'd119: muic2 <= 1'd0;

      8'd120: muic2 <= mi4;
      8'd121: muic2 <= mi4;
      8'd122: muic2 <= sol4;
      8'd123: muic2 <= sol4;
      8'd124: muic2 <= 1'd0;
      8'd125: muic2 <= do5;
      8'd126: muic2 <= do5;
      8'd127: muic2 <= sol4;
      8'd128: muic2 <= sol4;
      8'd129: muic2 <= 1'd0;
      8'd130: muic2 <= do5;
      8'd131: muic2 <= do5;
      8'd132: muic2 <= mi5;
      8'd133: muic2 <= mi5;
      8'd134: muic2 <= 1'd0;

      8'd135: muic2 <= mi4;
      8'd136: muic2 <= mi4;
      8'd137: muic2 <= sol4;
      8'd138: muic2 <= sol4;
      8'd139: muic2 <= 1'd0;
      8'd140: muic2 <= do5;
      8'd141: muic2 <= do5;
      8'd142: muic2 <= sol4;
      8'd143: muic2 <= sol4;
      8'd144: muic2 <= 1'd0;
      8'd145: muic2 <= do5;
      8'd146: muic2 <= do5;
      8'd147: muic2 <= mi5;
      8'd148: muic2 <= mi5;
      8'd149: muic2 <= 1'd0;

      8'd150: muic2 <= mi4;
      8'd151: muic2 <= mi4;
      8'd152: muic2 <= sol4;
      8'd153: muic2 <= sol4;
      8'd154: muic2 <= 1'd0;
      8'd155: muic2 <= do5;
      8'd156: muic2 <= do5;
      8'd157: muic2 <= sol4;
      8'd158: muic2 <= sol4;
      8'd159: muic2 <= 1'd0;
      8'd160: muic2 <= do5;
      8'd161: muic2 <= do5;
      8'd162: muic2 <= mi5;
      8'd163: muic2 <= mi5;
      8'd164: muic2 <= 1'd0;

      8'd165: muic2 <= mi4;
      8'd166: muic2 <= mi4;
      8'd167: muic2 <= sol4;
      8'd168: muic2 <= sol4;
      8'd169: muic2 <= 1'd0;
      8'd170: muic2 <= do5;
      8'd171: muic2 <= do5;
      8'd172: muic2 <= sol4;
      8'd173: muic2 <= sol4;
      8'd174: muic2 <= 1'd0;
      8'd175: muic2 <= do5;
      8'd176: muic2 <= do5;
      8'd177: muic2 <= mi5;
      8'd178: muic2 <= mi5;
      8'd179: muic2 <= 1'd0;

      8'd180: muic2 <= mi4;
      8'd181: muic2 <= mi4;
      8'd182: muic2 <= sol4;
      8'd183: muic2 <= sol4;
      8'd184: muic2 <= 1'd0;
      8'd185: muic2 <= do5;
      8'd186: muic2 <= do5;
      8'd187: muic2 <= sol4;
      8'd188: muic2 <= sol4;
      8'd189: muic2 <= 1'd0;
      8'd190: muic2 <= do5;
      8'd191: muic2 <= do5;
      8'd192: muic2 <= mi5;
      8'd193: muic2 <= mi5;
      8'd194: muic2 <= 1'd0;

      8'd195: muic2 <= mi4;
      8'd196: muic2 <= mi4;
      8'd197: muic2 <= sol4;
      8'd198: muic2 <= sol4;
      8'd199: muic2 <= 1'd0;
      8'd200: muic2 <= do5;
      8'd201: muic2 <= do5;
      8'd202: muic2 <= sol4;
      8'd203: muic2 <= sol4;
      8'd204: muic2 <= 1'd0;
      8'd205: muic2 <= do5;
      8'd206: muic2 <= do5;
      8'd207: muic2 <= mi5;
      8'd208: muic2 <= mi5;
      8'd209: muic2 <= 1'd0;

      8'd210: muic2 <= mi4;
      8'd211: muic2 <= mi4;
      8'd212: muic2 <= sol4;
      8'd213: muic2 <= sol4;
      8'd214: muic2 <= 1'd0;
      8'd215: muic2 <= do5;
      8'd216: muic2 <= do5;
      8'd217: muic2 <= sol4;
      8'd218: muic2 <= sol4;
      8'd219: muic2 <= 1'd0;
      8'd220: muic2 <= do5;
      8'd221: muic2 <= do5;
      8'd222: muic2 <= mi5;
      8'd223: muic2 <= mi5;
      8'd224: muic2 <= 1'd0;

      8'd225: muic2 <= mi4;
      8'd226: muic2 <= mi4;
      8'd227: muic2 <= sol4;
      8'd228: muic2 <= sol4;
      8'd229: muic2 <= 1'd0;
      8'd230: muic2 <= do5;
      8'd231: muic2 <= do5;
      8'd232: muic2 <= sol4;
      8'd233: muic2 <= sol4;
      8'd234: muic2 <= 1'd0;
      8'd235: muic2 <= do5;
      8'd236: muic2 <= do5;
      8'd237: muic2 <= mi5;
      8'd238: muic2 <= mi5;
      8'd239: muic2 <= 1'd0;

      8'd240: muic2 <= mi4;

      default: muic2 <= 1'd0;  // Valor por defecto
    endcase
  end
endmodule

module notas_tetriz (
    input clk,
    input [1:0] estado,
    output reg muic3
);



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

  wire do4, do5;
  wire db4, db5;
  wire re4, re5;
  wire eb4, eb5;
  wire mi4, mi5;
  wire fa4, fa5;
  wire gb4, gb5;
  wire sol4, sol5;
  wire ab4, ab5;
  wire la4, la5;
  wire bb4, bb5;
  wire si4, si5;

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
      8'd0:  muic3 <= la4;
      8'd1:  muic3 <= la4;
      8'd2:  muic3 <= la4;
      8'd3:  muic3 <= la4;
      8'd4:  muic3 <= sol4;
      8'd5:  muic3 <= sol4;
      8'd6:  muic3 <= sol4;
      8'd7:  muic3 <= sol4;
      8'd8:  muic3 <= gb4;
      8'd9:  muic3 <= gb4;
      8'd10: muic3 <= gb4;
      8'd11: muic3 <= gb4;
      8'd12: muic3 <= gb4;
      8'd13: muic3 <= gb4;
      8'd14: muic3 <= gb4;
      8'd15: muic3 <= gb4;
      8'd16: muic3 <= gb4;
      8'd17: muic3 <= 1'd0;
      8'd18: muic3 <= mi4;
      8'd19: muic3 <= mi4;
      8'd20: muic3 <= mi4;
      8'd21: muic3 <= mi4;
      8'd22: muic3 <= 1'd0;
      8'd23: muic3 <= 1'd0;
      8'd24: muic3 <= 1'd0;

      8'd25: muic3 <= la4;
      8'd26: muic3 <= la4;
      8'd27: muic3 <= la4;
      8'd28: muic3 <= la4;
      8'd29: muic3 <= sol4;
      8'd30: muic3 <= sol4;
      8'd31: muic3 <= sol4;
      8'd32: muic3 <= sol4;
      8'd33: muic3 <= gb4;
      8'd34: muic3 <= gb4;
      8'd35: muic3 <= gb4;
      8'd36: muic3 <= gb4;
      8'd37: muic3 <= gb4;
      8'd38: muic3 <= gb4;
      8'd39: muic3 <= gb4;
      8'd40: muic3 <= gb4;
      8'd41: muic3 <= gb4;
      8'd42: muic3 <= 1'd0;
      8'd43: muic3 <= mi4;
      8'd44: muic3 <= mi4;
      8'd45: muic3 <= mi4;
      8'd46: muic3 <= mi4;
      8'd47: muic3 <= 1'd0;
      8'd48: muic3 <= 1'd0;
      8'd49: muic3 <= 1'd0;

      8'd50: muic3 <= la4;
      8'd51: muic3 <= la4;
      8'd52: muic3 <= la4;
      8'd53: muic3 <= la4;
      8'd54: muic3 <= sol4;
      8'd55: muic3 <= sol4;
      8'd56: muic3 <= sol4;
      8'd57: muic3 <= sol4;
      8'd58: muic3 <= gb4;
      8'd59: muic3 <= gb4;
      8'd60: muic3 <= gb4;
      8'd61: muic3 <= gb4;
      8'd62: muic3 <= gb4;
      8'd63: muic3 <= gb4;
      8'd64: muic3 <= gb4;
      8'd65: muic3 <= gb4;
      8'd66: muic3 <= gb4;
      8'd67: muic3 <= 1'd0;
      8'd68: muic3 <= mi4;
      8'd69: muic3 <= mi4;
      8'd70: muic3 <= mi4;
      8'd71: muic3 <= mi4;
      8'd72: muic3 <= 1'd0;
      8'd73: muic3 <= 1'd0;
      8'd74: muic3 <= 1'd0;

      8'd75: muic3 <= la4;
      8'd76: muic3 <= la4;
      8'd77: muic3 <= la4;
      8'd78: muic3 <= la4;
      8'd79: muic3 <= sol4;
      8'd80: muic3 <= sol4;
      8'd81: muic3 <= sol4;
      8'd82: muic3 <= sol4;
      8'd83: muic3 <= gb4;
      8'd84: muic3 <= gb4;
      8'd85: muic3 <= gb4;
      8'd86: muic3 <= gb4;
      8'd87: muic3 <= gb4;
      8'd88: muic3 <= gb4;
      8'd89: muic3 <= gb4;
      8'd90: muic3 <= gb4;
      8'd91: muic3 <= gb4;
      8'd92: muic3 <= 1'd0;
      8'd93: muic3 <= mi4;
      8'd94: muic3 <= mi4;
      8'd95: muic3 <= mi4;
      8'd96: muic3 <= mi4;
      8'd97: muic3 <= 1'd0;
      8'd98: muic3 <= 1'd0;
      8'd99: muic3 <= 1'd0;

      8'd100: muic3 <= la4;
      8'd101: muic3 <= la4;
      8'd102: muic3 <= la4;
      8'd103: muic3 <= la4;
      8'd104: muic3 <= sol4;
      8'd105: muic3 <= sol4;
      8'd106: muic3 <= sol4;
      8'd107: muic3 <= sol4;
      8'd108: muic3 <= gb4;
      8'd109: muic3 <= gb4;
      8'd110: muic3 <= gb4;
      8'd111: muic3 <= gb4;
      8'd112: muic3 <= gb4;
      8'd113: muic3 <= gb4;
      8'd114: muic3 <= gb4;
      8'd115: muic3 <= gb4;
      8'd116: muic3 <= gb4;
      8'd117: muic3 <= 1'd0;
      8'd118: muic3 <= mi4;
      8'd119: muic3 <= mi4;
      8'd120: muic3 <= mi4;
      8'd121: muic3 <= mi4;
      8'd122: muic3 <= 1'd0;
      8'd123: muic3 <= 1'd0;
      8'd124: muic3 <= 1'd0;

      8'd125: muic3 <= la4;
      8'd126: muic3 <= la4;
      8'd127: muic3 <= la4;
      8'd128: muic3 <= la4;
      8'd129: muic3 <= sol4;
      8'd130: muic3 <= sol4;
      8'd131: muic3 <= sol4;
      8'd132: muic3 <= sol4;
      8'd133: muic3 <= gb4;
      8'd134: muic3 <= gb4;
      8'd135: muic3 <= gb4;
      8'd136: muic3 <= gb4;
      8'd137: muic3 <= gb4;
      8'd138: muic3 <= gb4;
      8'd139: muic3 <= gb4;
      8'd140: muic3 <= gb4;
      8'd141: muic3 <= gb4;
      8'd142: muic3 <= 1'd0;
      8'd143: muic3 <= mi4;
      8'd144: muic3 <= mi4;
      8'd145: muic3 <= mi4;
      8'd146: muic3 <= mi4;
      8'd147: muic3 <= 1'd0;
      8'd148: muic3 <= 1'd0;
      8'd149: muic3 <= 1'd0;

      8'd150: muic3 <= la4;
      8'd151: muic3 <= la4;
      8'd152: muic3 <= la4;
      8'd153: muic3 <= la4;
      8'd154: muic3 <= sol4;
      8'd155: muic3 <= sol4;
      8'd156: muic3 <= sol4;
      8'd157: muic3 <= sol4;
      8'd158: muic3 <= gb4;
      8'd159: muic3 <= gb4;
      8'd160: muic3 <= gb4;
      8'd161: muic3 <= gb4;
      8'd162: muic3 <= gb4;
      8'd163: muic3 <= gb4;
      8'd164: muic3 <= gb4;
      8'd165: muic3 <= gb4;
      8'd166: muic3 <= gb4;
      8'd167: muic3 <= 1'd0;
      8'd168: muic3 <= mi4;
      8'd169: muic3 <= mi4;
      8'd170: muic3 <= mi4;
      8'd171: muic3 <= mi4;
      8'd172: muic3 <= 1'd0;
      8'd173: muic3 <= 1'd0;
      8'd174: muic3 <= 1'd0;

      8'd175: muic3 <= la4;
      8'd176: muic3 <= la4;
      8'd177: muic3 <= la4;
      8'd178: muic3 <= la4;
      8'd179: muic3 <= sol4;
      8'd180: muic3 <= sol4;
      8'd181: muic3 <= sol4;
      8'd182: muic3 <= sol4;
      8'd183: muic3 <= gb4;
      8'd184: muic3 <= gb4;
      8'd185: muic3 <= gb4;
      8'd186: muic3 <= gb4;
      8'd187: muic3 <= gb4;
      8'd188: muic3 <= gb4;
      8'd189: muic3 <= gb4;
      8'd190: muic3 <= gb4;
      8'd191: muic3 <= gb4;
      8'd192: muic3 <= 1'd0;
      8'd193: muic3 <= mi4;
      8'd194: muic3 <= mi4;
      8'd195: muic3 <= mi4;
      8'd196: muic3 <= mi4;
      8'd197: muic3 <= 1'd0;
      8'd198: muic3 <= 1'd0;
      8'd199: muic3 <= 1'd0;

      8'd200: muic3 <= la4;
      8'd201: muic3 <= la4;
      8'd202: muic3 <= la4;
      8'd203: muic3 <= la4;
      8'd204: muic3 <= sol4;
      8'd205: muic3 <= sol4;
      8'd206: muic3 <= sol4;
      8'd207: muic3 <= sol4;
      8'd208: muic3 <= gb4;
      8'd209: muic3 <= gb4;
      8'd210: muic3 <= gb4;
      8'd211: muic3 <= gb4;
      8'd212: muic3 <= gb4;
      8'd213: muic3 <= gb4;
      8'd214: muic3 <= gb4;
      8'd215: muic3 <= gb4;
      8'd216: muic3 <= gb4;
      8'd217: muic3 <= 1'd0;
      8'd218: muic3 <= mi4;
      8'd219: muic3 <= mi4;
      8'd220: muic3 <= mi4;
      8'd221: muic3 <= mi4;
      8'd222: muic3 <= 1'd0;
      8'd223: muic3 <= 1'd0;
      8'd224: muic3 <= 1'd0;

      8'd225: muic3 <= la4;
      8'd226: muic3 <= la4;
      8'd227: muic3 <= la4;
      8'd228: muic3 <= la4;
      8'd229: muic3 <= sol4;
      8'd230: muic3 <= sol4;
      8'd231: muic3 <= sol4;
      8'd232: muic3 <= sol4;
      8'd233: muic3 <= gb4;
      8'd234: muic3 <= gb4;
      8'd235: muic3 <= gb4;
      8'd236: muic3 <= gb4;
      8'd237: muic3 <= gb4;
      8'd238: muic3 <= gb4;
      8'd239: muic3 <= gb4;
      8'd240: muic3 <= gb4;

      default: muic3 <= 1'd0;  // Valor por defecto
    endcase
  end
endmodule
