`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(clk ,rst, clk_div  );

input clk;
input rst;
output reg clk_div;

localparam constantNumber = 26'd25000000;

reg [25:0] count;

initial
begin
	count = 26'd0;
end
 
always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1) begin
        count = 26'b0;
	 end
    else if (count == constantNumber - 1) begin
        count = 26'b0;
	 end
    else begin
        count = count + 26'd1;
	 end
end

always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1) begin
        clk_div = 1'b0;
	 end
    else if (count == constantNumber - 1) begin
        clk_div = ~clk_div;
	 end
    else begin
        clk_div = clk_div;
	 end
end

endmodule
