`timescale 1ns / 1ps

module uart_system(
    input clk,
    input rx,
    input [7:0] sw_in,
    input btnSent,
    output tx,
    output wire [7:0] data_out,
    output reg [7:0] data_transmitted
    );
    
    reg en, last_rec;
    reg [7:0] data_in;
    wire received, baud, sent;
  
    baud_gen baudrate_gen(clk, baud);
    uart_rx RX(baud, rx, received, data_out);
    uart_tx TX(baud, data_in, en, sent, tx);
    
    always @(posedge baud) begin
        if (en) en = 0;
        if (~last_rec & received || btnSent) begin
            en <= 1;
            data_in = data_out;
            if(btnSent) data_in = sw_in;
            data_transmitted = data_in;
        end
        last_rec = received;
    end 
    
endmodule
