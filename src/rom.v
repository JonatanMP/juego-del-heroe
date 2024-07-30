module pers_rom (
    input clk,
    output reg [6:0] personaje,
    input [2:0] per_select
);

  always @(posedge clk) begin
    case (per_select)  //abcdefg
      0: personaje <= 7'b0111110;  // U
      1: personaje <= 7'b0000110;  // i
      2: personaje <= 7'b1100111;  // P
      3: personaje <= 7'b1000111;  // F
      4: personaje <= 7'b1001111;  // E
      5: personaje <= 7'b0001000;  // ⬇️
      6: personaje <= 7'b1000000;  //  ⬆️

    endcase
  end

endmodule  //rom


module U (
    input clk,
    output reg [6:0] personaje,
    input [1:0] per_select
);

  always @(posedge clk) begin
    case (per_select)  //abcdefg
      1: personaje <= 7'b1000000;  //  ⬆️
      2: personaje <= 7'b0001000;  // ⬇️
      default: personaje <= 7'b0111110;  // U
    endcase
  end

endmodule  //U

module i (
    input clk,
    output reg [6:0] personaje,
    input [1:0] per_select
);

  always @(posedge clk) begin
    case (per_select)  //abcdefg
      1: personaje <= 7'b1000000;  //  ⬆️
      2: personaje <= 7'b0001000;  // ⬇️
      default: personaje <= 7'b0000110;  // i
    endcase
  end

endmodule  //i

module P (
    input clk,
    output reg [6:0] personaje,
    input [1:0] per_select
);

  always @(posedge clk) begin
    case (per_select)  //abcdefg
      1: personaje <= 7'b1000000;  //  ⬆️
      2: personaje <= 7'b0001000;  // ⬇️
      default: personaje <= 7'b1100111;  // P
    endcase
  end

endmodule  //P

module F (
    input clk,
    output reg [6:0] personaje,
    input [1:0] per_select
);

  always @(posedge clk) begin
    case (per_select)  //abcdefg
      1: personaje <= 7'b1000000;  //  ⬆️
      2: personaje <= 7'b0001000;  // ⬇️
      default: personaje <= 7'b1000111;  // F
    endcase
  end

endmodule  //F

module E (
    input clk,
    output reg [6:0] personaje,
    input [1:0] per_select
);

  always @(posedge clk) begin
    case (per_select)  //abcdefg
      1: personaje <= 7'b1000000;  //  ⬆️
      2: personaje <= 7'b0001000;  // ⬇️
      default: personaje <= 7'b1001111;  // E
    endcase
  end

endmodule  //E