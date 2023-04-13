`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2023 18:22:06
// Design Name: 
// Module Name: counter
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


module counter(CLK, reset, counter_out

    );
    
    input logic CLK, reset;
    output logic [1:0] counter_out;
    
    logic [1:0]counter_up;
    
    always @(posedge CLK or posedge reset)
    begin
        if(reset | counter_up==2'b11 )
         counter_up <= 2'b0;
        else
         counter_up <= counter_up + 1;
        end 
        assign counter_out = counter_up;
        
    
endmodule
