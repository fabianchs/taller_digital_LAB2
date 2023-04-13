`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 08:35:28
// Design Name: 
// Module Name: activate_signals
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


module activate_signals(clk, reset, counter_in, JA_ENCO_INPUT, enable, message
    );
    
    input logic clk, reset, enable;
    input logic [1:0]counter_in, JA_ENCO_INPUT;
    output logic [3:0] message;
    
    logic r_0,r_1,r_2,r_3;
    
    //    input logic D, rst, clk,
    //output logic f_out,f_nout
    
    flip_flop OP_FF_0( .rst(reset), .D(counter_in[0]), .enable(enable), .f_out(r_0));
    flip_flop OP_FF_1( .rst(reset), .D(counter_in[1]), .enable(enable), .f_out(r_1));
    flip_flop OP_FF_2( .rst(reset), .D(JA_ENCO_INPUT[0]), .enable(enable), .f_out(r_2));
    flip_flop OP_FF_3( .rst(reset), .D(JA_ENCO_INPUT[1]), .enable(enable), .f_out(r_3));
    
    assign message={r_3,r_2,r_1,r_0};
    
endmodule
