`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:11:38 02/20/2022
// Design Name:   debouncer
// Module Name:   C:/Xilinx/CDA 4203L/Lab4/debouncer_testbench.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debouncer_testbench;

	// Inputs
	reg clk;
	reg clock_div;
	reg in;
	reg rst;

	// Outputs
	wire out;
	wire clock_div_to_deb;

	// Instantiate the Unit Under Test (UUT)
	clock_divider clk_divider(
			.clk(clk),
			.rst(rst),
			.clk_div(clock_div_to_deb)
	);
	
	debouncer uut (
		.clk(clk), 
		.clock_div(clock_div_to_deb), 
		.in(in), 
		.out(out)
	);

	always begin
		clk = ~clk;
		#10;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		clock_div = 0;
		in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		rst = 1;
		#100;
		rst = 0;
		#100;
		in = 1;
		#3000;
		in = 0;
		#100
		in = 1;
		#300;
		in = 0;

	end
      
endmodule

