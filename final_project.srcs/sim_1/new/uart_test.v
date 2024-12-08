`timescale 1ns / 1ps

module uart_test;
    // Testbench signals
    reg        clk;
    reg        btnU;
    reg        btnC;
    reg        RsRx;  // Added UART RX input
    reg  [7:0] sw;
    wire       JB;
    wire       Hsync;
    wire       Vsync;
    wire [3:0] vgaRed;
    wire [3:0] vgaGreen;
    wire [3:0] vgaBlue;

    // Clock and UART period definitions
    localparam CLK_PERIOD = 10;  // 100MHz clock
    localparam BAUD_RATE = 9600;
    localparam UART_PERIOD = 1000000000 / BAUD_RATE;  // ns per bit for UART
    localparam FRAME_WAIT = 16_666_667;  // ~16.7ms (60Hz frame)

//    // File handle and control flag for VGA output log
//    integer vga_log;
//    reg     file_open;

//    // DUT instance
//    TextDisplayWithBufferWithUartWithFifo DUT (
//        .clk     (clk),
//        .btnU    (btnU),
//        .RsRx    (RsRx),      // Connect UART RX
//        .RsTx    (),          // Unused
//        .Hsync   (Hsync),
//        .Vsync   (Vsync),
//        .vgaRed  (vgaRed),
//        .vgaGreen(vgaGreen),
//        .vgaBlue (vgaBlue),
//        .PS2Clk  (1'b1),      // Idle high
//        .PS2Data (1'b1),      // Idle high
//        .seg     (),          // Unused
//        .dp      (),          // Unused
//        .an      (),          // Unused
//        .sw      (sw),
//        .btnC    (btnC),
//        .JB      (JB),
//        .JC      (JB)         // Loop back JB to JC
//    );

    

    // Clock generation
    always begin
        clk = 0;
        #(CLK_PERIOD / 2);
        clk = 1;
        #(CLK_PERIOD / 2);
    end

    // Initialize file and control flag
//    initial begin
//        file_open = 0;
//        vga_log   = $fopen("vga_output.txt", "w");
//        if (vga_log == 0) begin
//            $display("Error: Could not open vga_output.txt");
//            $finish;
//        end
//        file_open = 1;
//        $display("Log file opened successfully");
//    end

    // Task for sending a byte through UART
    task send_uart_byte;
        input [7:0] data;
        integer i;
        begin
            // Start bit
            RsRx = 0;
            #(UART_PERIOD);

            // Data bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                RsRx = data[i];
                #(UART_PERIOD);
            end

            // Stop bit
            RsRx = 1;
            #(UART_PERIOD);

            // Extra delay between characters
            #(UART_PERIOD);
        end
    endtask

    // Test stimulus
    initial begin
        // Initialize inputs
        btnU = 1;
        btnC = 0;
        sw   = 8'h00;
        RsRx = 1;  // UART idle state is high

        // Wait for file to be opened
        wait (file_open);

        // Reset pulse
        #1000 btnU = 0;
        #1000;

        // Wait for display initialization
        #FRAME_WAIT;

        // Test UART communication
        $display("Starting UART tests");

        // Test Case 1: Send "Hello" via UART
        send_uart_byte("H");
        send_uart_byte("e");
        send_uart_byte("l");
        send_uart_byte("l");
        send_uart_byte("o");
        #FRAME_WAIT;

        // Test Case 2: Send newline sequence
        send_uart_byte(8'h0D);  // CR
        send_uart_byte(8'h0A);  // LF
        #FRAME_WAIT;

        // Test Case 3: Send "World!" on next line
        send_uart_byte("W");
        send_uart_byte("o");
        send_uart_byte("r");
        send_uart_byte("l");
        send_uart_byte("d");
        send_uart_byte("!");
        #FRAME_WAIT;

        // Wait for last display update
        #FRAME_WAIT;

        $display("Simulation completed - VGA log file left open for viewing");
    end

//    // VGA signal logging
//    always @(posedge clk) begin
//        if (file_open && DUT.display.sync_unit.p_tick) begin
//            $fwrite(vga_log, "%0d ns: %b %b %04b %04b %04b\n", $time,  // Current simulation time
//                    Hsync,  // H-sync
//                    Vsync,  // V-sync
//                    vgaRed,  // Red (4 bits)
//                    vgaGreen,  // Green (4 bits)
//                    vgaBlue  // Blue (4 bits)
//            );
//        end
//    end

    // Monitor important signals
    initial begin
        $monitor("Time=%0t RsRx=%b JB=%b Hsync=%b Vsync=%b", $time, RsRx, JB, Hsync, Vsync);
    end
endmodule