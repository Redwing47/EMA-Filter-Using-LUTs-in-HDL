`timescale 1ns / 1ps

module tb_ema_filter_lut;

    reg clk;
    reg reset;
    reg [7:0] x_in;
    wire [7:0] y_out;
    
    integer output_file;

    // Instantiate DUT
    ema_filter_lut dut (
        .clk(clk),
        .reset(reset),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $display("\n=== EMA LUT FILTER TEST ===");
        
        // Open output file for writing - use "a" for append if you want to keep old data
        output_file = $fopen("ema_filter_output.txt", "w");
        if (output_file == 0) begin
            $display("Error: Could not open output file!");
            $finish;
        end
        
        // Write header to file
        $fdisplay(output_file, "Time(ns) x_in y_out");
        $fdisplay(output_file, "-------------------");

        reset = 1;
        x_in  = 0;

        // Wait 2 clock cycles
        repeat (2) @(posedge clk);

        reset = 0;
        @(posedge clk);

        // --- Apply 50 for 10 cycles ---
        x_in = 8'd50;
        repeat (30) begin
            @(posedge clk);
            $display("time=%0t  x_in=%0d  y_out=%0d", $time, x_in, y_out);
            $fdisplay(output_file, "%0t %0d %0d", $time, x_in, y_out);
            $fflush(output_file);  // Force write to file immediately
        end

        // --- Apply 200 for 10 cycles ---
        x_in = 8'd200;
        repeat (30) begin
            @(posedge clk);
            $display("time=%0t  x_in=%0d  y_out=%0d", $time, x_in, y_out);
            $fdisplay(output_file, "%0t %0d %0d", $time, x_in, y_out);
            $fflush(output_file);
        end

        // --- Apply 20 for 10 cycles ---
        x_in = 8'd20;
        repeat (100) begin
            @(posedge clk);
            $display("time=%0t  x_in=%0d  y_out=%0d", $time, x_in, y_out);
            $fdisplay(output_file, "%0t %0d %0d", $time, x_in, y_out);
            $fflush(output_file);
        end

        $display("\n=== TEST COMPLETE ===\n");
        $display("Output values saved to 'ema_filter_output.txt'");
        
        // Close the file
        $fclose(output_file);
        $finish;
    end

endmodule