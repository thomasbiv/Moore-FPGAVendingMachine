`timescale 1ns / 1ps

module lab_board(LED, SW, CLK, BTN);

output [2:0] LED;
input [2:0] SW;
input [3:1] BTN;
input CLK;

	wire clk_D, deb_qu, deb_ni, deb_di;

	clock_divider clk_divider(
			.clk(CLK),
			.rst(SW[0]),
			.clk_div(clk_D)
	);
	
	debouncer deb_quarter(
			.clk(CLK),
			.clock_div(clk_D),
			.in(BTN[1]),
			.out(deb_qu)
	);
	
	debouncer deb_nickel(
			.clk(CLK),
			.clock_div(clk_D),
			.in(BTN[2]),
			.out(deb_ni)
	);
	
	debouncer deb_dime(
			.clk(CLK),
			.clock_div(clk_D),
			.in(BTN[3]),
			.out(deb_di)
	);

	FSM Moore(
			.ni(deb_ni), 
			.di(deb_di), 
			.qu(deb_qu),
			.rst(SW[0]),
			.giveSoda(LED[0]), 
			.giveDiet(LED[1]), 
			.change(LED[2]), 
			.CLK(clk_D),
			.soda(SW[1]),
			.diet(SW[2])
	);
	
endmodule
