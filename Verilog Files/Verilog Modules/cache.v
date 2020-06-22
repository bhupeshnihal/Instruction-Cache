`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bhupesh Nihal
// 
// Create Date:    05:42:20 06/20/2020 
// Design Name: 
// Module Name:    cache 
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
module cache(input clk,input reset,input [31:0] address, input [63:0] block, input cache_write, output reg cache_miss, output reg [31:0] instruction
    );
reg [91:0] cache_mem [7:0];
reg [91:0] r1,r2; /*wire [91:0] r1,r2;*/
wire [1:0] set; wire[26:0] tag; wire block_offset; reg [3:0] lru;
assign set=address[4:3]; assign tag=address[31:5]; assign block_offset=address[2];

always@(cache_mem,set)
begin
r1=cache_mem[{set,1'b0}];
r2=cache_mem[{set,1'b1}];
end

always@(reset,set,tag,address,block_offset,r1,r2)
begin

if(reset==0) begin
lru<=4'b0000;
cache_miss<=1'b0;
end

else begin

if({address[1],address[0]}==2'b00) begin

if((tag==r1[27:1])&&(r1[0]==1)) begin
instruction<=@(posedge clk) block_offset?r1[91:60]:r1[59:28];
cache_miss<=1'b0;
lru[set]<=1'b1;
end
else if((tag==r2[27:1])&&(r2[0]==1)) begin
instruction<=@(posedge clk) block_offset?r2[91:60]:r2[59:28];
cache_miss<=1'b0;
lru[set]<=1'b0;
end

else begin
instruction<=@(posedge clk) 32'bx;
cache_miss<=1'b1;
end

end
end
end

always@(posedge clk, negedge reset)
begin

if (reset==0)
$readmemh("cache.mem",cache_mem);

else begin

if(cache_write==1'b1) begin

if (r1[0]==1'b0) begin
cache_mem[{set,1'b0}]={block,tag,1'b1};
end
else if(r2[0]==1'b0) begin
cache_mem[{set,1'b1}]={block,tag,1'b1};
end
else begin
cache_mem[{set,lru[set]}]={block,tag,1'b1};
end

end
end
end

endmodule
