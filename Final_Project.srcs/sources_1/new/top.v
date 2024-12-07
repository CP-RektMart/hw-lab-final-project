`timescale 1ns / 1ps

module top(
    input wire [7:0]sw,
    input reset, btnU,
    input wire RsRx,
    input clk,
    input JA1,
    output JA2,
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
    
    //data configuration
    wire [7:0] data_received_1;
    wire [7:0] data_transmitted_1;
    wire [7:0] data_received_2;
    wire [7:0] data_transmitted_2;
    wire [3839:0] ascii_grid_flat;
    wire data_valid_1;
    wire data_valid_2;
    wire [7:0] iterator;
    
    //grid display
//    ascii_grid grid(clk, data_valid_2, reset, data_transmitted_1, ascii_grid_flat, iterator);
    ascii_grid grid(clk, data_valid_1, reset, data_transmitted_1, ascii_grid_flat, iterator);
    
    //receiving from others
    uart_system uart1(
        .clk(clk),
        .rx(RsRx),
        .tx(RsTx),
        .sw_in(sw),
        .data_received(data_received_1),
        .data_transmitted(data_transmitted_1),
        .data_valid(data_valid_1),
        .btnSent(btnU)
    );
    
    //receiving from keyboard - TO BE IMPLEMENTED
//    uart_system uart2(
//        .clk(clk),
//        .rx(JA1),
//        .tx(RsTx),
//        .sw_in(sw),
//        .data_received(data_received_2),
//        .data_transmitted(data_transmitted_2),
//        .data_valid(data_valid_2),
//        .btnSent(1'b0)
//    );
    
    hexDisplay hxd (
        .seg(seg),
        .dp(dp),
        .an(an),
        .data_in({ascii_grid_flat[(3839 - (iterator * 16)) -: 16]}),
        .clk(clk)
    );
    
    //output
    assign led = data_received_1;
    
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
