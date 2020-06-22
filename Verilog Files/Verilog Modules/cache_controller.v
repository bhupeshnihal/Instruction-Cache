`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bhupesh Nihal
// 
// Create Date:    05:42:09 06/20/2020 
// Design Name: 
// Module Name:    cache_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cache_controller(input clk,input reset,input [31:0] address,output [31:0] instruction, output cache_miss
    );
wire [63:0] block; wire cache_write;
cache c1(clk,reset,address,block,cache_write,cache_miss,instruction);
main_memory m1(clk,reset,address,cache_miss,block,cache_write);

endmodule
