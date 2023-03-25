`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2023 14:37:54
// Design Name: 
// Module Name: clocking_options
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


module clocking_options( clk_in1, clk_out1, reset, locked

    );
    
    input clk_in1, reset;
    output clk_out1, locked;
    
      clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_out1(clk_out1),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in1)      // input clk_in1
);

endmodule
