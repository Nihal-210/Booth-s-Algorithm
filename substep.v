`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2025 06:43:06 AM
// Design Name: 
// Module Name: substep
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


module substep(
    input  [3:0] ac,
    input  [3:0] br,
    input  [3:0] qr,
    input        q,
    output reg [3:0] new_ac,
    output reg [3:0] new_qr,
    output reg       new_q
);
    reg signed [4:0] temp;          
    reg [8:0] combined;             // {ac[3:0], qr[3:0], q}

    always @(*) begin
        
        case ({qr[0], q})
            2'b01: temp = ac + br;
            2'b10: temp = ac - br; 
            default: temp = ac;
        endcase

        
        combined = {temp[3:0], qr, q};        // temp[4] is overflow, ignore
        combined = {combined[8], combined[8:1]}; 

        
        new_ac = combined[8:5];
        new_qr = combined[4:1];
        new_q  = combined[0];
    end
endmodule


