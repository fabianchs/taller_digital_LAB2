`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2023 13:46:26
// Design Name: 
// Module Name: top_module
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


module top_module(BTN_CENTER,CLK, reset, LED );

    input logic BTN_CENTER, CLK, reset;
    output logic [15:0] LED;
    
    
    logic sw,enable, CLK_LESS;
    
    less_clk OP0 (.clk_in(CLK), .clk_out(CLK_LESS));
    synchronizer OP1(.button(BTN_CENTER), .out_sync(sw), .clk(CLK_LESS), .rst(reset));
    debounce_module OP2(.sw(sw),.reset(reset), .clk(CLK_LESS), .db(enable));
    counter OP3(.enable(enable), .clk(CLK_LESS), .reset(reset), .out(LED), .rst_enable(enable));
    
 
    
endmodule