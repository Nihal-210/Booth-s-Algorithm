
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2025 08:51:59 AM
// Design Name: 
// Module Name: main_tb
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


`timescale 1ns/1ps

module booth_tb;

    reg  signed [3:0] multiplicand, multiplier;
    wire signed [7:0] product;

    
    booth_main uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        $display("Time\tMultiplicand\tMultiplier\tProduct");
        $monitor("%4dns\t%d\t\t%d\t\t%d", $time, multiplicand, multiplier, product);

        // Test cases
        multiplicand =  4'sd3;  multiplier =  4'sd2;   #10;  // 3 * 2 = 6
        multiplicand = -4'sd3;  multiplier =  4'sd2;   #10;  // -3 * 2 = -6
        multiplicand =  4'sd4;  multiplier = -4'sd3;   #10;  // 4 * -3 = -12
        multiplicand =  4'sd7;  multiplier =  4'sd7;   #10;  // 7 * 7 = 49
        multiplicand = -4'sd4;  multiplier = -4'sd4;   #10;  // -4 * -4 = 16
        multiplicand =  4'sd0;  multiplier = -4'sd7;   #10;  // 0 * -7 = 0
       

        #10 $finish;
    end

endmodule

