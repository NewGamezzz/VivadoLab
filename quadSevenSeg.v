`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2021 11:12:15 PM
// Design Name: 
// Module Name: quadSevenSeg
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


module quadSevenSeg(
    output [6:0] seg,
    output reg dp,
    output a0,
    output a1,
    output a2,
    output a3,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input date_year,
    input clk
    );

reg [1:0] ns;
reg [1:0] ps;
reg [3:0] dispEn;


reg [3:0] hexIn;
wire [6:0] segments;
assign seg = segments;
initial
begin
    dp = 0;
    ns = 0;
    ps = 0;
end

hexTo7Segment segDecode(segments, hexIn);
assign {a3, a2, a1, a0} = ~dispEn;

always @(posedge clk)
begin
    ps = ns;
end

always @(ps)
begin   
    ns = ps + 1;
end

always @(ps)
begin
    case(ps)
        2'b00: dispEn = 4'b0001;
        2'b01: dispEn = 4'b0010;
        2'b10: dispEn = 4'b0100;
        2'b11: dispEn = 4'b1000;
    endcase
end

always @(ps)
begin
    case(ps)
        2'b00: hexIn = num0;
        2'b01: hexIn = num1;
        2'b10: hexIn = num2;
        2'b11: hexIn = num3;
    endcase
end

always @(ps or date_year)
begin
//    if(date_year == 0)
//    begin
//    case(ps)
//        2'b00: dp = 0;
//        2'b01: dp = 1;
//        2'b10: dp = 0;
//        2'b11: dp = 1;
//    endcase
//    end
    
//    if(date_year == 1)
//    begin
//    case(ps)
//        2'b00: dp = 0;
//        2'b01: dp = 1;
//        2'b10: dp = 1;
//        2'b11: dp = 1;
//    endcase
//    end
    case(ps)
        2'b00: dp = 0;
        2'b01: dp = 1;
        2'b10: dp = date_year;
        2'b11: dp = 1;
    endcase
end

endmodule
