`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2023 15:58:25
// Design Name: 
// Module Name: ss_multiplexing
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


module ss_multiplexing(AN, SEG_DISPL, CLK, RESET, AN_LOW);

    input logic CLK, RESET;
    output logic [3:0]AN, AN_LOW;
    output logic [6:0] SEG_DISPL;
    assign AN_LOW=4'b1111;
    logic [15:0] sixteen;
    
    logic CLK_LESS;
    
    logic [3:0] g0=sixteen[3:0];
    logic [3:0] g1=sixteen[7:4];
    logic [3:0] g2=sixteen[11:8];
    logic [3:0] g3=sixteen[15:12];
    
    logic [3:0] data_to_send;
    
    initial begin  AN=4'b1101; AN_LOW=4'b1111; data_to_send=g1; sixteen=16'hFFFF; end
    
    
    always @(posedge CLK_LESS) begin
    
    case (AN)
        4'b1110: begin AN<=4'b1101; data_to_send=g1; end
        4'b1101: begin AN<=4'b1011; data_to_send=g2; end
        4'b1011: begin AN<=4'b0111; data_to_send=g3; end
        4'b0111: begin AN<=4'b1110; data_to_send=g0; end
        
        default: AN<=4'b1110;
    endcase
    
    
    end
    
    lfsr OP0(.clk(CLK), .rst(RESET), .out(sixteen));
    less_clk OP1(.clk_in(CLK), .clk_out(CLK_LESS));
    bin_to_ss OP2(.hex(data_to_send), .seven_seg(SEG_DISPL));
    
    


    
endmodule
