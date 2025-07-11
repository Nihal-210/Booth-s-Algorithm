`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2025 06:43:06 AM
// Design Name: 
// Module Name: main
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

module booth_main(
    input  signed [3:0] multiplicand,
    input  signed [3:0] multiplier,
    output signed [7:0] product
);

    wire [3:0] AC0 = 4'b0000;
    wire [3:0] QR0 = multiplier;
    wire [3:0] BR  = multiplicand;
    wire       Q0  = 1'b0;

    // Intermediates
    wire [3:0] AC1, QR1, AC2, QR2, AC3, QR3, AC4, QR4;
    wire       Q1, Q2, Q3, Q4;

    
    substep s1(AC0, BR, QR0, Q0, AC1, QR1, Q1);
    substep s2(AC1, BR, QR1, Q1, AC2, QR2, Q2);
    substep s3(AC2, BR, QR2, Q2, AC3, QR3, Q3);
    substep s4(AC3, BR, QR3, Q3, AC4, QR4, Q4);

    
    wire signed [7:0] full_result;
    assign full_result = $signed({AC4, QR4});
    assign product = full_result;

endmodule
