`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bhupesh Nihal
// 
// Create Date:    05:42:35 06/20/2020 
// Design Name: 
// Module Name:    main_memory 
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
module main_memory(input clk, input reset, input [31:0] address, input cache_miss, output reg [63:0] block, output reg cache_write
    );
reg [7:0] main [127:0];


always@(address,cache_miss,main,reset)
begin

if(reset==0) begin
$readmemh("main_memory.mem",main);
cache_write<=1'b0;
end

else begin
if(cache_miss==1'b1)
begin
block<=repeat(9)@(posedge clk) address[2]?{main[address+3],main[address+2],main[address+1],main[address],
main[address-1],main[address-2],main[address-3],main[address-4]} : {main[address+7],main[address+6],main[address+5],main[address+4],
main[address+3],main[address+2],main[address+1],main[address]};
cache_write<=repeat(9)@(posedge clk) 1'b1;
cache_write<=repeat(10)@(posedge clk) 1'b0;
end
end
end
endmodule
