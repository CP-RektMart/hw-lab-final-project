`timescale 1ns / 1ps

module top(
    input clk,          // 100MHz on Basys 3
    input reset,        // btnC on Basys 3
 
    input [11:0] sw,    // switch 12 bits
    input btnU,         // ascii input btn
    output hsync,       // to VGA connector
    output vsync,       // to VGA connector
    output [11:0] rgb,  // to DAC, to VGA connector
 
    input rx,           // USB-RS232 Rx
    output tx,           // USB-RS232 Tx
    
    output [6:0] seg,   
    output dp,
    output [3:0] an
    );
    
    // signals
    wire ascii_ready;
    wire data_ready;
    wire [7:0] ascii;
    wire tick;
    wire data_ready_debounced;
//    wire [6:0] receiver_ascii, transmitter_ascii;
    
    
    // single pulser
    single_pulser sp1 (
        .clk(clk),
        .pushed(btnU),
        .d(ascii_ready)
    );
    
    single_pulser sp2 (
        .clk(clk),
        .pushed(data_ready),
        .d(data_ready_debounced)
    );
    
    // vga
    vga v (
        .clk(clk),
        .reset(reset),
        .ascii(ascii),
        .ascii_ready(data_ready_debounced),
        .hsync(hsync),      
        .vsync(vsync),       
        .rgb(rgb)
    );
     
    // baud rate generator
    baud_rate_generator brg (
        .clk_100MHz(clk),       
        .reset(reset),          
        .tick(tick)             
    );
    
    // uart reciever
    uart_receiver ur (
        .clk_100MHz(clk),          
        .reset(reset),                    
        .rx(rx),                       
        .sample_tick(tick),              
        .data_ready(data_ready),          
        .data_out(ascii)
    );
    
    // uart transmitter
    uart_transmitter ut (          
        .clk_100MHz(clk),               
        .reset(reset),                    
        .tx_start(data_ready),                 
        .sample_tick(tick),              
        .data_in(ascii),           
        .tx_done(),                
        .tx(tx)                       
    );
    
    // segment ascii display
    segment_ascii sa (
        .clk(clk),
        .data_in(ascii), 
        .data_out(ascii),
        .data_in_ready(data_ready), 
        .data_out_ready(data_ready),
        .seg(seg),
        .dp(dp),
        .an(an)
    );
    
endmodule