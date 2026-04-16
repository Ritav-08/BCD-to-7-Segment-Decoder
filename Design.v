`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2026 16:24:08
// Design Name: 
// Module Name: BCDt7Sdecoder
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


module BCDt7Sdecoder(
   input [3:0]a_i, 
   output reg [6:0]y_o
);
//starting from top to clockwise then centre at last, abcdefg
always@(*)
case (a_i)
4'b0000: y_o = 7'b1111110; //0
4'b0001: y_o = 7'b0110000; //1
4'b0010: y_o = 7'b1101101; //2
4'b0011: y_o = 7'b1111001; //3
4'b0100: y_o = 7'b0110011; //4
4'b0101: y_o = 7'b1011011; //5
4'b0110: y_o = 7'b1011111; //6
4'b0111: y_o = 7'b1110000; //7
4'b1000: y_o = 7'b1111111; //8
4'b1001: y_o = 7'b1111011; //9
//4'b1010: y_o = 7'b1111111; //to verify if self checking in testbench is working or not
default: y_o = 7'b0000000; //All OFF
endcase

endmodule