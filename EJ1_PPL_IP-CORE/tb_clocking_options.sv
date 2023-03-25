`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 12:48:58
// Design Name: 
// Module Name: tb_clocking_options
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


module tb_clocking_options;

    logic clk_in1, reset;
    logic clk_out1, locked;
    
    
    clocking_options dut(.clk_in1(clk_in1),.reset(reset), .clk_out1(clk_out1),.locked(locked));
    
    always 
    
        begin  
        
        #10
        clk_in1<=1'b0;

        #10
        clk_in1<=1'b1;

        end
        

    initial begin #1 reset<=1;  ; #1 reset<=0; end
    

endmodule
