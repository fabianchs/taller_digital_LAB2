`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 16:26:39
// Design Name: 
// Module Name: tb_counter
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


module tb_counter;
    
    logic enable, clk, reset;
    logic [7:0] out;
    
    counter dut(.enable(enable), .clk(clk), .reset(reset), .out(out));
    
    always 
    
        begin  
        
        #50
        clk<=1'b0;

        #50
        clk<=1'b1;

        end
    
    initial begin
    
    enable<=1;
    #60
    enable<=0;
    #300
    enable<=1;
    #300
    enable<=0;
    #60
    enable<=1;
    #300
    enable<=0;
    #200
    enable<=1;
    
    $finish;
    end
    
    initial begin #100 reset=1'b1; #10 reset=1'b0; end


endmodule
