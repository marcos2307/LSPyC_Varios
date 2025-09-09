`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:03 09/06/2024 
// Design Name: 
// Module Name:    PWM_deadtime_tb 
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
module PWM_deadtime_tb(
    );
reg [9:0] d;
reg clk, en;
wire T1, T2;

PWM_deadtime pwm_dt(
.clk(clk),
.en(en),
.d(d),
.T1(T1),
.T2(T2)
);


always begin
   clk = 1'b0;
   #5;
	clk = 1'b1;
   #5;
end  

initial begin
   d = 1;
	#2000000;
	   d = 100;
	#2000000;
	   d = 500;
	#2000000;
	   d = 999;
	#2000000;
end  

endmodule
