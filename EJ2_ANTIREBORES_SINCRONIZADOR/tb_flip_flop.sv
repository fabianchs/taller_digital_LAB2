`timescale 1ns / 1ps



module tb_flipflop;

    logic Q;
    logic nQ;
    logic D;
    logic rst;
    logic clk;
    
    flip_flop dut (
    
    .Q (Q),
    .nQ (nQ),
    .D (D),
    .rst (rst),
    .clk (clk)
  
    );
    



    initial begin
        clk=0;
        end
        always begin
        #5
        clk=~clk;
    end 
    
    initial begin
        rst=0;
        D=1;
        #10
        rst=1;
        D=1;
        #10
        rst=0;
        D=0;
        #10
        rst=1;
        D=0;
        $finish;
    end   
        

    
endmodule