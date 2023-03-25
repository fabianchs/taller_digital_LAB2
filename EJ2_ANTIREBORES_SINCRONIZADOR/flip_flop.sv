`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module flip_flop(
    input logic D, rst, clk,
    output logic Q,nQ
    );
    
    always_ff @(posedge clk, posedge rst) begin
    
        if (rst) begin 
            Q=0;
            nQ=1;
        end else begin
            Q=D;
            nQ=~D;
        end
    
    end
   
endmodule
