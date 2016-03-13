`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:18:45 03/10/2016
// Design Name:   divider
// Module Name:   C:/ehorner/workspaces/edmund/source/xilinx/divider/divider_test.v
// Project Name:  divider
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divider_test;

	// Inputs
	reg clk;
	reg [7:0] numerator;
	reg [7:0] denominator;
	reg reset;

	// Outputs
	wire [7:0] quotient;
	wire [7:0] remainder;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	divider uut (
		.clk(clk), 
		.numerator(numerator), 
		.denominator(denominator), 
		.reset(reset), 
		.quotient(quotient), 
		.remainder(remainder), 
		.ready(ready)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		numerator = 8'bXXXXXXXX;
		denominator = 8'bXXXXXXXX;
		reset = 0;

		// Add stimulus here
		#5;
		numerator = 89;
		denominator = 6;
		reset = 1;
		
		#10;
		reset = 0;
		numerator = 8'bXXXXXXXX;
		denominator = 8'bXXXXXXXX;
		
		#100;
		$stop;
	end
	
	always #5 clk = !clk;
	
endmodule

