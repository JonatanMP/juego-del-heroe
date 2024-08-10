module lo (
   input clk,
   input [7:0]value,
   output reg [7:0]unidades, decenas, centenas 
);

always @(posedge clk) begin
    unidades = value % 10;
    decenas = (value / 10) % 10;
    centenas = (value / 100) % 10;
end

endmodule //lo de modulo