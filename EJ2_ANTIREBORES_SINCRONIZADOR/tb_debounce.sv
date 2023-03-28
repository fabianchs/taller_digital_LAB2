`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2023 14:15:34
// Design Name: 
// Module Name: tb_debounce
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


module tb_debounce;

    logic clk, reset;
    logic sw;
    logic db;
    
    debounce_module dut(.clk(clk),.sw(sw),.reset(reset),.db(db));


    always 
    
        begin  
        
        #50
        clk<=1'b0;

        #50
        clk<=1'b1;

    end
    
    initial begin 
    
    #60
    sw<=1'b1;
    #600000000
    sw<=1;
    #60
    sw<=0;
    #60
    sw<=1;
    #60
    sw<=0;   
    #600000
    sw<=1;
    #60
    sw<=0;
    
    
    
    
    $finish;
    end
    
    initial begin #10 reset<=1; #10 reset<=0; end
endmodule
