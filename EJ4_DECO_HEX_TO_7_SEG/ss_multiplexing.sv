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


module ss_multiplexing(AN, SEG_DISPL, CLK, AN_LOW

    );
    input logic CLK;
    output logic [3:0]AN, AN_LOW;
    output logic [6:0] SEG_DISPL;
    
    assign AN_LOW=4'b1111;
    logic [15:0] sixteen=16'b0011001000010000;
    

    
    logic [3:0] g0=sixteen[3:0];
    logic [3:0] g1=sixteen[7:4];
    logic [3:0] g2=sixteen[11:8];
    logic [3:0] g3=sixteen[15:12];
    
    logic [3:0] data_to_send;
    
    initial begin AN=4'b1110; end
    logic clk_out_1;
    
   clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_out1(clk_out1),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(CLK)      // input clk_in1
);
    

    
    always @(posedge clk_out_1) begin
    
    case (AN)
        4'b1110: begin AN<=4'b1101; data_to_send=g1; end
        4'b1101: begin AN<=4'b1011; data_to_send=g2; end
        4'b1011: begin AN<=4'b0111; data_to_send=g3; end
        4'b0111: begin AN<=4'b1110; data_to_send=g0; end
        
        default: AN<=1110;
    endcase
    
    
    end

        
    bin_to_ss OP0(.hex(data_to_send), .seven_seg(SEG_DISPL));
    
    


    
endmodule
