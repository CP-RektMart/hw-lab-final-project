`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 09:00:22 PM
// Design Name: 
// Module Name: ascii_grid
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


module ascii_grid(
    input clk,
    input data_valid,
    input reset,
    input [7:0] data_transmitted,
    output reg [1679:0] ascii_grid_flat
    );
    
    reg [7:0] iterator; // 8 bit char pointer 0-239
    initial iterator = 0;
    
    initial begin
        ascii_grid_flat = {
            7'h42, 7'h4F, 7'h4F, 7'h4D, 7'h43, 7'h48, 7'h41, 7'h4E, 7'h4F, 7'h54, 7'h41, 7'h49, 7'h2E, 7'h43, 7'h4F, 7'h4D, 7'h51, 7'h52, 7'h53, 7'h54, 7'h41, 7'h42, 7'h43, 7'h44, 7'h45, 7'h46, 7'h47, 7'h48, 7'h49, 7'h4A, 7'h4B, 7'h4C, 7'h4D, 7'h4E, 7'h4F, 7'h50, 7'h51, 7'h52, 7'h53, 7'h54,  // Row 1
            7'h61, 7'h62, 7'h63, 7'h64, 7'h65, 7'h66, 7'h67, 7'h68, 7'h69, 7'h6A, 7'h6B, 7'h6C, 7'h6D, 7'h6E, 7'h6F, 7'h4D, 7'h51, 7'h52, 7'h53, 7'h54, 7'h41, 7'h42, 7'h43, 7'h44, 7'h45, 7'h46, 7'h47, 7'h48, 7'h49, 7'h4A, 7'h4B, 7'h4C, 7'h4D, 7'h4E, 7'h4F, 7'h50, 7'h51, 7'h52, 7'h53, 7'h54,  // Row 2
            7'h42, 7'h4F, 7'h4F, 7'h4D, 7'h43, 7'h48, 7'h41, 7'h4E, 7'h4F, 7'h54, 7'h41, 7'h49, 7'h2E, 7'h43, 7'h4F, 7'h4D, 7'h51, 7'h52, 7'h53, 7'h54, 7'h41, 7'h42, 7'h43, 7'h44, 7'h45, 7'h46, 7'h47, 7'h48, 7'h49, 7'h4A, 7'h4B, 7'h4C, 7'h4D, 7'h4E, 7'h4F, 7'h50, 7'h51, 7'h52, 7'h53, 7'h54,  // Row 3
            7'h42, 7'h4F, 7'h4F, 7'h4D, 7'h43, 7'h48, 7'h41, 7'h4E, 7'h4F, 7'h54, 7'h41, 7'h49, 7'h2E, 7'h43, 7'h4F, 7'h4D, 7'h51, 7'h52, 7'h53, 7'h54, 7'h41, 7'h42, 7'h43, 7'h44, 7'h45, 7'h46, 7'h47, 7'h48, 7'h49, 7'h4A, 7'h4B, 7'h4C, 7'h4D, 7'h4E, 7'h4F, 7'h50, 7'h51, 7'h52, 7'h53, 7'h54,  // Row 4
            7'h42, 7'h4F, 7'h4F, 7'h4D, 7'h43, 7'h48, 7'h41, 7'h4E, 7'h4F, 7'h54, 7'h41, 7'h49, 7'h2E, 7'h43, 7'h4F, 7'h4D, 7'h51, 7'h52, 7'h53, 7'h54, 7'h41, 7'h42, 7'h43, 7'h44, 7'h45, 7'h46, 7'h47, 7'h48, 7'h49, 7'h4A, 7'h4B, 7'h4C, 7'h4D, 7'h4E, 7'h4F, 7'h50, 7'h51, 7'h52, 7'h53, 7'h54,  // Row 5
            7'h42, 7'h4F, 7'h4F, 7'h4D, 7'h43, 7'h48, 7'h41, 7'h4E, 7'h4F, 7'h54, 7'h41, 7'h49, 7'h2E, 7'h43, 7'h4F, 7'h4D, 7'h51, 7'h52, 7'h53, 7'h54, 7'h41, 7'h42, 7'h43, 7'h44, 7'h45, 7'h46, 7'h47, 7'h48, 7'h49, 7'h4A, 7'h4B, 7'h4C, 7'h4D, 7'h4E, 7'h4F, 7'h50, 7'h51, 7'h52, 7'h53, 7'h54  // Row 6
        };
    end
    
    reg debounce;
	initial debounce = 0;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            iterator = 8'b0; // Reset iterator correctly
        end else if (data_valid) begin
            if (debounce == 0) begin
                ascii_grid_flat[(1679 - (iterator * 7)) -: 7] = data_transmitted; 
                iterator = (iterator + 1) % 240; 
                debounce = 1;
            end
        end else if (data_valid == 0) begin
            debounce = 0;
        end
    end
endmodule
