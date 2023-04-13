`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 09:39:00
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


module top_module(CLK, reset, JA, JA_ENCO_INPUT, JA_COUNTER_OUT, AN, SS_LED, DP);
    
    input logic CLK, reset;
    input logic [3:0] JA;
    input logic [1:0] JA_ENCO_INPUT;
    output logic [1:0] JA_COUNTER_OUT;
    output logic [7:0]AN;
    output logic [6:0]SS_LED;
    output logic DP;
    

    
    logic enable;
    logic [3:0]message;
    
    counter OP_0_TM(.CLK(CLK), .reset(reset), .counter_out(JA_COUNTER_OUT) );
    keyboard_inputs_to_debounce OP_1_TM(.clk(CLK), .reset(reset), .rows(JA), .enable(enable));
    activate_signals OP_2_TM (.clk(CLK), .reset(reset), .counter_in(JA_COUNTER_OUT), .JA_ENCO_INPUT(JA_ENCO_INPUT), .enable(enable), .message(message));
    seven_segments OP_3_TM (.clk(CLK), .message(message), .SS_RESPONSE(SS_LED), .AN_INTERNAL(AN), .DP_INTERNAL(DP));
    
endmodule

