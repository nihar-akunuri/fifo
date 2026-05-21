`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 11:50:50
// Design Name: 
// Module Name: tb_fifo
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


module tb_fifo();

parameter WIDTH = 8;
parameter DEPTH = 8;

reg clk, rst, w_en, r_en;
reg [WIDTH-1:0]d_in;
wire empty, full;
wire [WIDTH-1:0]d_out;

initial {clk,rst,w_en,r_en,d_in} = 0;

fifo #(8,8) uut (clk,rst,w_en,r_en,d_in,full,empty,d_out);

always #2 clk = ~clk;

initial begin

@(negedge clk)
rst = 1;
@(negedge clk)
rst = 0;
d_in = 8'hAB;
@(negedge clk)
w_en = 1;
r_en = 1;
@(negedge clk)
w_en = 0;
r_en = 0;
//@(negedge clk)
//w_en = 0;
//d_in = 8'h9A;
//@(negedge clk)
//w_en = 1;
//@(negedge clk)
//w_en = 0;
//r_en = 1;
//@(negedge clk)
//r_en = 0;
//@(negedge clk)
//r_en = 0;
//@(negedge clk)
//r_en = 1;
//@(negedge clk)
//r_en = 0;

end 

endmodule
