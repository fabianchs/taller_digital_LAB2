`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 16:23:22
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


module counter(out,  enable, clk, reset);

 

    input logic enable, clk, reset;
    output logic [7:0] out;



    always @(posedge clk)
    if (reset) begin
      out <= 8'b0 ;
    end else if (enable) begin
      out <= out + 1;
    end
endmodule


