`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:50:15 02/17/2022
// Design Name:   FSM
// Module Name:   C:/Xilinx/CDA 4203L/Lab4/FSM_testbench.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_testbench;

	// Inputs
	reg ni;
	reg di;
	reg qu;
	reg CLK;
	reg soda;
	reg diet;
	reg rst;

	// Bidirs
	wire giveSoda;
	wire giveDiet;
	wire change;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.ni(ni), 
		.di(di), 
		.qu(qu),
		.rst(rst),
		.giveSoda(giveSoda), 
		.giveDiet(giveDiet), 
		.change(change), 
		.CLK(CLK),
		.soda(soda),
		.diet(diet)
	);
	// Clock generator.
	always begin
		CLK = ~CLK;
		#10;
	end
	
	initial begin
		// Initialize Inputs
		ni = 0;
		di = 0;
		qu = 0;
		CLK = 0;
		soda = 0;
		diet = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#103;
		qu = 1;
		#20;
		qu = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		qu = 1;
		#20;
		qu = 0;
		soda = 1;
		#20;
		soda = 0;
		#103;
		qu = 1;
		#20;
		qu = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		di = 1;
		#20;
		di = 0;
		#20;
		qu = 1;
		#20;
		qu = 0;
		diet = 1;
		#20;
		diet = 0;
		#103;
		ni = 1;
		#20;
		ni = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		#20;
		ni = 1;
		#20;
		ni = 0;
		diet = 1;
		#20;
		diet = 0;
		
        
		// Add stimulus here

	end
      
endmodule

