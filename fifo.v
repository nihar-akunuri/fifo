`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 11:11:44
// Design Name: 
// Module Name: fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo #(parameter WIDTH = 8, parameter DEPTH = 8) 
        (input clk,rst, w_en, r_en, [WIDTH-1:0]d_in, output reg full, empty, reg [WIDTH-1:0]d_out);
        
        
reg [WIDTH-1:0]fifo[DEPTH-1:0];

integer i;
reg [2:0]w_add = 0; 
reg [2:0]r_add = 0;
always @(posedge clk)
begin

if(rst) begin
for(i=0;i<DEPTH;i=i+1)
fifo[i] <= 0;
end 

if(w_add == r_add)
empty <= 1;

if(r_add == w_add +1)
full <= 1;

if(w_en) begin
fifo[w_add] <= d_in;
w_add <= w_add + 1;
end

if(r_en) begin
d_out <= fifo[r_add];
r_add <= r_add + 1;
end 
 

end 
        
endmodule
