`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module flip_flop(
    input logic D, rst, clk,
    output logic f_out,f_nout
    );
    
    always_ff @(posedge clk, posedge rst) begin
    
        if (rst) begin 
            f_out=0;
            f_nout=1;
        end else begin
            f_out=D;
            f_nout=~D;
        end
    
    end
   
endmodule
