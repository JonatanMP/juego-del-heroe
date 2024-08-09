module estados(
input clk, 
input reset, 
input boton,
output reg [1:0] estado
);
 
reg [1:0] status;  // estado
reg  [1:0]pulso_cambio;




always@(negedge boton or negedge reset)begin
if(!reset)begin
pulso_cambio <= 1'd0;
end
else
pulso_cambio <= pulso_cambio + 1'd1;

end

 
always @(posedge clk) begin
 
    case (status)
      0: if (pulso_cambio==2'd1) begin
           status <= 1;
           estado <= 2'b00;
         end
      1: 
           if (pulso_cambio == 2'd2)begin
           status <= 0;
           estado <= 2'b01;
         end
    
      
    endcase
end
endmodule

