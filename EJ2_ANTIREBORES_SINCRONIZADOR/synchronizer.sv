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
    
    logic [3:0]sig;
    
    
    assign sig={sig,button};
    
     genvar i;
     generate 
         for(i=1; i<4;i++) begin
           flip_flop sync_op(.D(sig[i-1]),.Q(sig[i]), .clk(clk), .rst(rst)); 
         end
     endgenerate
    
    assign out_sync=sig[3];

    
endmodule
