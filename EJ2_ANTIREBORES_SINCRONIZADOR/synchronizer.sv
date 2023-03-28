`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 16:12:44
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(button, out_sync, clk,rst);
    
    input logic button, clk,rst;
    output logic out_sync;
    
    logic sig_0,sig_1, sig_2;
    
    
    assign sig={sig,button};
    
     flip_flop FO(.D(button),.f_out(sig_0), .clk(clk), .rst(rst));
     flip_flop F1(.D(sig_0),.f_out(sig_1), .clk(clk), .rst(rst));
     flip_flop F2(.D(sig_1),.f_out(sig_2), .clk(clk), .rst(rst));
     flip_flop F3(.D(sig_2),.f_out(out_sync), .clk(clk), .rst(rst));
     
    


    
endmodule
