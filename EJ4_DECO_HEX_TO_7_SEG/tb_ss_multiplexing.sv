`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2023 16:48:37
// Design Name: 
// Module Name: tb_ss_multiplexing
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


module tb_ss_multiplexing;
    
    logic CLK;
    logic [3:0] AN;
    logic [6:0] SEG_DISPL;
    
    ss_multiplexing dut(.CLK(CLK), .AN(AN), .SEG_DISPL(SEG_DISPL));
    
        always 
    
        begin  
        
        #50
        CLK<=1'b0;

        #50
        CLK<=1'b1;

        end


endmodule
