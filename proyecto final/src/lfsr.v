module lfsr #(
    parameter N = 3
) (
    input clk,
  //  input reset,
    input [3:0] presente,
    input [N:0] lfsr_in,
    output reg [N:0] disp0,
    output reg [N:0] disp1,
    output reg [N:0] disp2,
    output reg [N:0] disp3,
    output reg lfsr_ok = 1'b0
);

  reg [2:0] count;
  reg [N:0] r_reg;
  wire feedback_value;
  wire [N:0] r_next;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count   <= 2'd0;
      lfsr_ok <= 1'b0;
      r_reg   <= 0;
      disp0   <= 0;
      disp1   <= 0;
      disp2   <= 0;
      disp3   <= 0;
    end else if (clk && presente == 3'd1 && !lfsr_ok) begin
      case (count)
        3'd0: begin
          r_reg <= lfsr_in;
          count <= count + 2'd1;
        end
        3'd1: begin
          r_reg <= r_next;
          disp0 <= r_next;
          count <= count + 2'd1;
        end
        3'd2: begin
          r_reg <= r_next;
          disp1 <= r_next;
          count <= count + 2'd1;
        end
        3'd3: begin
          r_reg <= r_next;
          disp2 <= r_next;
          count <= count + 2'd1;
        end
        3'd4: begin
          disp3   <= r_next;
          lfsr_ok <= 1'b1;
        end
      endcase
    end
  end

  assign feedback_value = r_reg[N] ^ r_reg[N-1] ^ r_reg[0];
  assign r_next = {feedback_value, r_reg[N:1]};

endmodule