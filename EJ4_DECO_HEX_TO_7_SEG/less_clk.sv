`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2023 09:53:15
// Design Name: 
// Module Name: less_clk
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
//Profe aquí tuve que ayudarme con internet porque el clocking wizard no estaba funcionando

module less_clk (
    input clk_in,
    output logic clk_out
);

// Set the PLL parameters
parameter F_REF = 1_000_000;  // Reference frequency of 1 MHz
parameter F_OUT = 1_000_000_000;  // Output frequency of 1 GHz
parameter DIV = F_OUT / F_REF;  // Divider value

// Declare the PLL signals
logic [15:0] counter = 0;
logic [31:0] phase_accumulator = 0;
logic [31:0] feedback_divider = 0;

// Generate the feedback clock
always @(posedge clk_in) begin
    feedback_divider <= feedback_divider + DIV;
end

// Generate the output clock using the PLL
always @(posedge clk_in) begin
    // Increment the phase accumulator
    phase_accumulator <= phase_accumulator + feedback_divider;
    
    // Check if the phase accumulator has overflowed
    if (phase_accumulator >= (1 << 31)) begin
        phase_accumulator <= phase_accumulator - (1 << 31);
        counter <= counter + 1;
    end
    
    // Toggle the output clock on overflow
    if (counter >= DIV / 2) begin
        counter <= 0;
        clk_out <= ~clk_out;
    end
end

endmodule