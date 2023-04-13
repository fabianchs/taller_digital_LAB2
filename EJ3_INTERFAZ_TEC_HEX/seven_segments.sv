`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 08:47:48
// Design Name: 
// Module Name: seven_segments
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


module seven_segments(message, clk, SS_RESPONSE, AN_INTERNAL, DP_INTERNAL);
    
    input logic [3:0]message;
    input logic clk;
    output logic DP_INTERNAL;
    output logic [6:0]SS_RESPONSE;
    output logic [7:0]AN_INTERNAL;
    
    assign AN_INTERNAL=8'b11111110;
    assign DP_INTERNAL=1;
    
    bin_to_ss OP_0_SS(.hex(message), .dp(DP), .seven_seg(SS_RESPONSE));
    
    
endmodule
