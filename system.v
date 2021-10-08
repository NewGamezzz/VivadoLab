`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2021 11:30:13 PM
// Design Name: 
// Module Name: system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk
    );

wire [3:0] num0;
wire [3:0] num1;
wire [3:0] num2;
wire [3:0] num3;
wire date_year;

wire targetClk;
wire ndyClk;
wire an0, an1, an2, an3;

assign an = {an3, an2, an1, an0};

wire [26:0] tclk;

assign tclk[0] = clk;

genvar c;
generate for(c=0; c<26; c=c+1)
begin
    clockDiv fdiv(tclk[c+1], tclk[c]);
end endgenerate

clockDiv fdivTarget(targetClk, tclk[18]);
clockDiv fndyTarget(ndyClk, tclk[26]);

numDateYear NDY(date_year, num3, num2, num1, num0, ndyClk);

quadSevenSeg q7seg(seg, dp, an0, an1, an2, an3, num0, num1, num2, num3, date_year, targetClk);

endmodule
