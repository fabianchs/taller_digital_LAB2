`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2023 09:38:24
// Design Name: 
// Module Name: lsfr
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

module lfsr (
    input clk,
    input rst,
    output logic [15:0] out
);

parameter COUNT_VALUE = 100_000_000 * 2; // 2 seconds with a 100 MHz clock

logic [31:0] count = 0;
logic [15:0] lfsr_reg;
logic feedback, zero_two, three_five;

        xor (zero_two,lfsr_reg[0],lfsr_reg[2]);
        xor (three_five,lfsr_reg[4],lfsr_reg[6]);
        xor (feedback, zero_two, three_five);
        
always @(posedge clk) begin
    if (rst) begin
        lfsr_reg <= 16'hFFFF; // initialize to all 1's
        count <= 0;
    end else begin
        lfsr_reg <= {lfsr_reg[14:0], feedback};
        count <= count + 1;
        if (count == COUNT_VALUE) begin
            count <= 0;
            out <= lfsr_reg;
        end
    end
end

endmodule