`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2023 14:58:34
// Design Name: 
// Module Name: mux_sel
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


module mux_sel(jumpdir, sel, out);

    input logic jumpdir;
    input logic [1:0]sel;
    output logic out;
    
    //00 reset
    //01 hold
    //10 PC+4
    //11 salto, pc_i
    
    always @(sel) begin
    case (sel)
        2'b00: out<=1'b0;
        2'b01: out<=out;
        2'b10: out<=out+4;
        2'b11: out<=jumpdir;
        default out<=out;
        
    endcase
    end
         
    
    
    
    
endmodule
