`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 03:31:23 PM
// Design Name: 
// Module Name: ascii_input
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


module ascii_input
#(
    parameter ascii_size = 12,
    parameter ascii_flat_size = 2048,
    parameter ascii_index_size = 11
)
(
    input clk,
    input [ascii_size-1:0] ascii,
    input ready_signal,
    input reset,
    output reg [ascii_flat_size-1:0] ascii_flat
    );

    // ascii flat management
    integer row;
    integer col;
    wire [ascii_index_size:0] ascii_index;
    
    initial begin
        row = 0; 
        col = 0;
        ascii_flat = 0;
    end
    
    assign ascii_index = (ascii_flat_size-1) - (row*((ascii_size-1)*32)) - (col*(ascii_size-1));
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            row <= 0;
            col <= 0;
            ascii_flat <= 0;
        end else if (ready_signal) begin
            ascii_flat[ascii_index -: ascii_size] <= ascii;
            col <= col + 1;
            
            if (ascii == 12'hE0 || ascii == 12'hB8) begin
                col <= col - 1;
            end
            
            // '\n' handler
            if (ascii == 12'd13) begin
                col <= 0;
                row <= row + 1;
            end
            
            
            // new row
            if (col >= 32) begin
                row <= row + 1;
                col <= 0;
            end
           
            // new page
            if (row >= 4) begin
                row <= 0;
            end
        end
    end

    
endmodule
