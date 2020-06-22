`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bhupesh Nihal
//
// Create Date:   05:48:26 06/20/2020
// Design Name:   cache_controller
// Module Name:   /home/ise/memory_subsystem/test_memory.v
// Project Name:  memory_subsystem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cache_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_memory;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] address;

	// Outputs
	wire [31:0] instruction;
	wire cache_miss;

	// Instantiate the Unit Under Test (UUT)
	cache_controller uut (
		.clk(clk), 
		.reset(reset), 
		.address(address), 
		.instruction(instruction), 
		.cache_miss(cache_miss)
	);

	initial begin
		reset = 0;
		#3 reset=1;
		end      
	initial begin
		clk = 0;
		repeat(250)
		#4 clk=~clk;
		$finish;
		end
		
	initial begin
	address=@(posedge clk) -4;
	end
	
	always@(posedge clk)
	begin
	if(cache_miss!=1'b1)
	address=address+($random%2)*4+($random%2)*4;
	end

endmodule

