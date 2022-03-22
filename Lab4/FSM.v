`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Deez
// Engineer: Nuts
// 
// Create Date:    15:38:27 02/15/2022 
// Design Name: Vending Machine
// Module Name:    FSM 
// Project Name: Vend dis stuff
// Target Devices: All of them
// Tool versions: None
// Description: It just works.
//
// Dependencies: Your mom
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM(ni, di, qu, soda, diet, change, CLK, rst, giveSoda, giveDiet);

	input CLK, qu, di, ni, rst, soda, diet;
	output reg giveSoda, giveDiet;
	output reg change;

// Register the current state.
	reg [4:0] curr_state = 5'b00000;

// Parameters for each specific state.
	localparam init_state = 5'd0,
	state_5 = 5'd1,
	state_10 = 5'd2,
	state_15 = 5'd3,
	state_20 = 5'd4,
	state_25 = 5'd5,
	state_30 = 5'd6,
	state_35 = 5'd7,
	state_40 = 5'd8,
	state_45 = 5'd9,
	state_50 = 5'd10,
	state_55 = 5'd11,
	state_60 = 5'd12,
	state_65 = 5'd13,
	state_soda = 5'd14,
	state_diet = 5'd15,
	state_60inter = 5'd16,
	state_55inter = 5'd17,
	state_50inter = 5'd18,
	state_45inter = 5'd19;


// Moore Finite State Machine describing a basic process of vending.
// A portion of the states correspond to the amount of change put into the machine.
// The final two states define either giving a soda or giving diet, before reseting to the initial state. 
always @(posedge CLK) begin
	if (rst == 1) begin
		curr_state = init_state;
	end
	else
		case (curr_state)
			init_state : begin
				giveSoda = 0;
				giveDiet = 0;
				change = 0;
				if (qu == 1)
					curr_state = state_25;
				else if (di == 1)
					curr_state = state_10;
				else if (ni == 1)
					curr_state = state_5;
			end
			state_5 : begin
				if (qu == 1) begin
					curr_state = state_30;
					end
				else if (di == 1) begin
					curr_state = state_15;
					end
				else if (ni == 1) begin
					curr_state = state_10;
					end
			end
			state_10 : begin
				if (qu == 1) begin
					curr_state = state_35;
					end
				else if (di == 1) begin
					curr_state = state_20;
					end
				else if (ni == 1) begin
					curr_state = state_15;
					end
			end
			state_15 : begin
				if (qu == 1) begin
					curr_state = state_40;
					end
				else if (di == 1) begin
					curr_state = state_25;
					end
				else if (ni == 1) begin
					curr_state = state_20;
					end
			end
			state_20 : begin
				if (qu == 1) begin
					curr_state = state_45;
					end
				else if (di == 1) begin
					curr_state = state_30;
					end
				else if (ni == 1) begin
					curr_state = state_25;
					end
			end
			state_25 : begin
				if (qu == 1) begin
					curr_state = state_50;
					end
				else if (di == 1) begin
					curr_state = state_35;
					end
				else if (ni == 1) begin
					curr_state = state_30;
					end
			end
			state_30 : begin
				if (qu == 1) begin
					curr_state = state_55;
					end
				else if (di == 1) begin
					curr_state = state_40;
					end
				else if (ni == 1) begin
					curr_state = state_35;
					end
			end
			state_35 : begin
				if (qu == 1) begin
					curr_state = state_60;
					end
				else if (di == 1) begin
					curr_state = state_45;
					end
				else if (ni == 1) begin
					curr_state = state_40;
					end
			end
			state_40 : begin
				if (qu == 1) begin
					curr_state = state_65;
					end
				else if (di == 1) begin
					curr_state = state_50;
					end
				else if (ni == 1) begin
					curr_state = state_45;
					end
			end
			state_45 : begin
				if (soda == 1) begin
					giveSoda = 1;
					curr_state = init_state;
				end
				else if (diet == 1) begin
					giveDiet = 1;
					curr_state = init_state;
				end
				else if (giveDiet == 1 || giveSoda == 1) begin
					curr_state = init_state;
				end
			end
			state_50 : begin
				if (soda == 1) begin
					giveSoda = 1;
					change = 1;
					curr_state = state_45inter;
				end
				else if (diet == 1) begin
					giveDiet= 1;
					change = 1;
					curr_state = state_45inter;
				end
				else if (giveDiet == 1 || giveSoda == 1) begin
					change = 1;
					curr_state = state_45inter;
				 end
			end
			state_55 : begin
				if (soda == 1) begin
					giveSoda = 1;
					change = 1;
					curr_state = state_50inter;
				end
				else if (diet == 1) begin
					giveDiet= 1;
					change = 1;
					curr_state = state_50inter;
				end
				else if (giveDiet == 1 || giveSoda == 1) begin
					change = 1;
					curr_state = state_50inter;
				end
			end
			state_60 : begin
				if (soda == 1) begin
					giveSoda = 1;
					change = 1;
					curr_state = state_55inter;
				end
				else if (diet == 1) begin
					giveDiet= 1;
					change = 1;
					curr_state = state_55inter;
				end
				else if (giveDiet == 1 || giveSoda == 1) begin
					change = 1;
					curr_state = state_55inter;
				end
			end
			state_65 : begin
				if (soda == 1) begin
					giveSoda = 1;
					change = 1;
					curr_state = state_60inter;
				end
				else if (diet == 1) begin
					giveDiet= 1;
					change = 1;
					curr_state = state_60inter;
				end
			end
			state_60inter : begin
				change = 0;
				curr_state = state_60;
			end
			state_55inter : begin
				change = 0;
				curr_state = state_55;
			end
			state_50inter : begin
				change = 0;
				curr_state = state_50;
			end
			state_45inter : begin
				change = 0;
				curr_state = state_45;
			end
		endcase
	end
	
endmodule
