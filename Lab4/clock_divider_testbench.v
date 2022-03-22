`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:41 02/20/2022
// Design Name:   clock_divider
// Module Name:   C:/Xilinx/CDA 4203L/Lab4/clock_divider_testbench.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clock_divider_testbench;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire clk_div;

	// Instantiate the Unit Under Test (UUT)
	clock_divider uut (
		.clk(clk), 
		.rst(rst), 
		.clk_div(clk_div)
	);

	always begin
		clk = ~clk;
		#10;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
		#100;
		rst = 0;
		
        
		// Add stimulus here

	end
      
endmodule

