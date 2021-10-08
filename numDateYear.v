`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2021 04:16:42 PM
// Design Name: 
// Module Name: numDateYear
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


module numDateYear(
    output reg date_year,
    output reg [3:0] num3,
    output reg [3:0] num2,
    output reg [3:0] num1,
    output reg [3:0] num0,
    input clock
    );
    
reg ps;
reg ns;
initial
begin
    ps = 0;
    ns = 0;
end

always @(posedge clock)
begin
    ps = ns;
end

always @(ps)
begin
    case(ps)
        1'b0: ns = 1;
        1'b1: ns = 0;
    endcase
end

always @(ps)
begin
    case(ps)
        1'b0:
        begin
            num0 = 4;
            num1 = 1;
            num2 = 1;
            num3 = 1;
        end 
        1'b1:
        begin
            num0 = 0;
            num1 = 0;
            num2 = 0;
            num3 = 2;        
        end
    endcase
end

always @(ps)
begin
    case(ps)
        1'b0: date_year = 0;
        1'b1: date_year = 1;
    endcase
end

endmodule
