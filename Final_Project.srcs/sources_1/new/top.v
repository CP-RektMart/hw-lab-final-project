`timescale 1ns / 1ps

//module top(
//    input clk,          // 100MHz on Basys 3
//    input reset,        // btnC on Basys 3
//    output hsync,       // to VGA connector
//    output vsync,       // to VGA connector
//    output [11:0] rgb   // to DAC, to VGA connector
//    );
    
//    // signals
//    wire [9:0] w_x, w_y;
//    wire w_video_on, w_p_tick;
//    reg [11:0] rgb_reg;
//    wire [11:0] rgb_next;
    
//    // VGA Controller
//    vga_controller vga(.clk_100MHz(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
//                       .video_on(w_video_on), .p_tick(w_p_tick), .x(w_x), .y(w_y));
//    // Text Generation Circuit
//    ascii_test at(.clk(clk), .video_on(w_video_on), .x(w_x), .y(w_y), .rgb(rgb_next));
    
//    // rgb buffer
//    always @(posedge clk)
//        if(w_p_tick)
//            rgb_reg <= rgb_next;
            
//    // output
//    assign rgb = rgb_reg;
      
//endmodule

module top(
    input wire [7:0]sw,
    input reset, btnU,
    input wire RsRx,
    input clk,
    output wire RsTx,
    output wire [7:0] led,
    output wire [3:0] an,
    output wire [6:0] seg,
    output wire dp,
    output hsync,       // to VGA connector
    output vsync,       // to VGA connector
    output [11:0] rgb   // to DAC, to VGA connector
    );
    
     // signals
    wire [9:0] w_x, w_y;
    wire w_video_on, w_p_tick;
    reg [11:0] rgb_reg;
    wire [11:0] rgb_next;
    
    reg [7:0] iterator; // 8 bit char pointer 0-239
    initial iterator = 0;
    
    // Flattened ascii_grid (40 characters x 7 bits)
    reg [1679:0] ascii_grid_flat; 
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
    
    wire [7:0] data_received;
    wire [7:0] data_transmitted;
    wire data_valid;
    
    uart_system uart(
        .clk(clk),
        .rx(RsRx),
        .tx(RsTx),
        .sw_in(sw),
        .data_received(data_received),
        .data_transmitted(data_transmitted),
        .data_valid(data_valid),
        .btnSent(btnU)
    );
	
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
    
    hexDisplay hxd (
        .seg(seg),
        .dp(dp),
        .an(an),
        .data_in({data_transmitted, data_received}),
        .clk(clk)
    );
    
    //output
    assign led = data_received;
    
     // VGA Controller
    // RUN NUMBER
    vga_controller vga(.clk_100MHz(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                       .video_on(w_video_on), .p_tick(w_p_tick), .x(w_x), .y(w_y));
    // Text Generation Circuit
    // gen text
    ascii_test at(.clk(clk), .ascii_grid_flat(ascii_grid_flat), .video_on(w_video_on), .x(w_x), .y(w_y), .rgb(rgb_next));
    
    // rgb buffer
    always @(posedge clk)
        if(w_p_tick)
            rgb_reg <= rgb_next;
            
    // output
    assign rgb = rgb_reg;
    
endmodule