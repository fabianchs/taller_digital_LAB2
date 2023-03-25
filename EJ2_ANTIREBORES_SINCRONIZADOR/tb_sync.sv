`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 15:20:43
// Design Name: 
// Module Name: tb_sync
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


module tb_sync;

    logic button, clk,rst;
    logic out_sync;
    
    synchronizer dut(.button(button), .clk(clk), .rst(rst), .out_sync(out_sync));
    
    always 
    
        begin  
        
        #50
        clk<=1'b0;

        #50
        clk<=1'b1;

        end
    
    initial begin
    
    #100
    button<=1;
    rst<=0;
    #50
    button<=0;
    #5
    button<=1;
    #5
    button<=0;
    #55
    button<=1;
    #10
    button<=1;
    #10
    button<=0;
    #10
    button<=0;
    #10
    button<=1;
    #10
    button<=0;
    #33
    button<=1;
    #33
    button<=0;
    #33
    button<=1;
    #33
    button<=0;
    #20
    button<=1;
    #45
    button<=0;
    $finish;

    end
    
    initial begin #1 rst<=1; #1 rst<=0; end    
    
endmodule
