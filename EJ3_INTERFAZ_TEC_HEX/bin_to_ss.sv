`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2023 13:36:58
// Design Name: 
// Module Name: bin_to_ss
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


module bin_to_ss(hex, dp, seven_seg 

    );
    

    input logic [3:0]hex;
    output logic [6:0] seven_seg; 
    output dp;
    
        always @*
    begin
        case(hex)
            4'b0000: seven_seg[6:0] = 7'b1000000;
            4'b0001: seven_seg[6:0] = 7'b1111001;
            4'b0010: seven_seg[6:0] = 7'b0100100;
            4'b0011: seven_seg[6:0] = 7'b0110000;
            4'b0100: seven_seg[6:0] = 7'b0011001;
            4'b0101: seven_seg[6:0] = 7'b0010010;
            4'b0110: seven_seg[6:0] = 7'b0000010;
            4'b0111: seven_seg[6:0] = 7'b1111000;
            4'b1000: seven_seg[6:0] = 7'b0000000;
            4'b1001: seven_seg[6:0] = 7'b0010000;
            4'b1010: seven_seg[6:0] = 7'b0001000;
            4'b1011: seven_seg[6:0] = 7'b0000011;
            4'b1100: seven_seg[6:0] = 7'b1000110;
            4'b1101: seven_seg[6:0] = 7'b0100001;
            4'b1110: seven_seg[6:0] = 7'b0000110;
            4'b1111: seven_seg[6:0] = 7'b0001110;
            
           default seven_seg[6:0]=7'b0111000;
        endcase
        seven_seg[7]=dp; //El MSB está conectado a dp
    end

    
    
endmodule
