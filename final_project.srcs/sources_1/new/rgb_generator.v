`timescale 1ns / 1ps
// Reference book: "FPGA Prototyping by Verilog Examples"
//                    "Xilinx Spartan-3 Version"
// Authored by: Pong P. Chu
// Published by: Wiley, 2008
// Adapted for use on Basys 3 FPGA with Xilinx Artix-7
// by: David J. Marion aka FPGA Dude

module rgb_generator
#(
    parameter ascii_size = 12,
    parameter ascii_flat_size = 2048,
    parameter ascii_index_size = 11
)
(
    input clk,
    input video_on,
    input [9:0] x, y,
    input [ascii_flat_size-1:0] ascii_flat,
    output reg [11:0] rgb
    );
    
    // signal declarations
    wire [ascii_size+4-1:0] rom_addr;           // 11-bit text ROM address
    wire [ascii_size-1:0] ascii_char;          // 7-bit ASCII character code
    wire [3:0] char_row;            // 4-bit row of ASCII character
    wire [2:0] bit_addr;            // column number of ROM data
    wire [7:0] rom_data;            // 8-bit row data from text ROM
    wire ascii_bit, ascii_bit_on;     // ROM bit and status signal
    wire [ascii_index_size:0] ascii_index;
    
    // instantiate ASCII ROM
    ascii_rom rom(.clk(clk), .addr(rom_addr), .data(rom_data));
      
    // ASCII ROM interface
    assign rom_addr = {ascii_char, char_row};   // ROM address is ascii code + row
    assign ascii_bit = rom_data[~bit_addr];     // reverse bit order
    assign ascii_index = (ascii_flat_size-1) - ((y-208)/16)*(ascii_size*32) - ((x-192)/8)*ascii_size;
    assign ascii_char = ascii_flat[ascii_index -: ascii_size];
    assign char_row = y[3:0];               // row number of ascii character rom
    assign bit_addr = x[2:0];               // column number of ascii character rom
    // "on" region in center of screen
    assign ascii_bit_on = ((x >= 192 && x < 448) && (y >= 208 && y < 272)) ? ascii_bit : 1'b0;
    
    integer borderWidth = 4;
	integer taskbarHeight = 20;

    
    // rgb multiplexing circuit
    always @*
        if(~video_on)
            rgb = 12'h000;      // blank
        else
            if(ascii_bit_on)
                rgb = 12'h00F;  // blue letters
            else
            		if (
                        (y >= 0 && y < 480 && x >= 0 && x < borderWidth) ||
                        (y >= 0 && y < 480 && x >= 640 - borderWidth && x < 640) ||
                        (y >= 0 && y < borderWidth && x >= 0 && x < 640) ||
                        (y >= 480 - borderWidth && y < 480 && x >= 0 && x < 640)
                    )
                        rgb = 12'h000;
                    else if (y >= 0 && y < taskbarHeight && x >= 0 && x < 640)
                        rgb = 12'h000;
                    else if (
                        (y >= 300 && y < 340 && x >= 100 && x < 110) ||
                        (y >= 310 && y < 320 && x >= 110 && x < 140) ||
                        (y >= 345 && y < 360 && x >= 70 && x < 140)
                    )
                    rgb = 12'h3CB54A;
//                        rgb = 12'h3B5;
//rgb = 12'hFFF;
                    else if (y >= 360 && y < 375 && x >= 60 && x < 130)
                    rgb = 12'hFFCC00;
//                        rgb = 12'hFC0;
//rgb = 12'hFFF;
                    else if (y >= 375 && y < 390 && x >= 55 && x < 120)
                    rgb = 12'hFF6D00;
//                        rgb = 12'hF60;
//rgb = 12'hFFF;
                    else if (y >= 390 && y < 405 && x >= 60 && x < 120)
                    rgb = 12'hFF3B30;
//                        rgb = 12'hF33;
//         rgb = 12'hFFF;
                    else if (y >= 405 && y < 420 && x >= 65 && x < 130)
                    rgb = 12'hAF52DE;
//                        rgb = 12'hA5D;
//rgb = 12'hFFF;
                    else if (y >= 420 && y < 435 && x >= 70 && x < 140)
                    rgb = 12'h5AC8FA;
//                        rgb = 12'h5CF;
//                          rgb = 12'hFFF;
                    else 
                        rgb = 12'hFFF;
   endmodule