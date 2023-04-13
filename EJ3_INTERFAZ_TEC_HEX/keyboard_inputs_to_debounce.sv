`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 08:18:56
// Design Name: 
// Module Name: keyboard_inputs_to_debounce
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


module keyboard_inputs_to_debounce(rows ,enable, clk, reset);

    input logic  clk, reset;
    input logic [3:0]rows;
    output logic enable;
    
    logic en_0,en_1,en_2, en_3;
    
    
     debounce_detection OP_ROW_0(.clk(clk),.reset(reset), .sw(rows[0]),.db(en_0));
     debounce_detection OP_ROW_1(.clk(clk),.reset(reset), .sw(rows[1]),.db(en_1));
     debounce_detection OP_ROW_2(.clk(clk),.reset(reset), .sw(rows[2]),.db(en_2));
     debounce_detection OP_ROW_3(.clk(clk),.reset(reset), .sw(rows[3]),.db(en_3));
     
    always @*
        if (en_0 | en_1 | en_2 | en_3) begin
            enable<=1; end
            else begin
            enable<=0;
            end
   

    
endmodule
