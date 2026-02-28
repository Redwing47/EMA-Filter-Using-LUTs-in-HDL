`timescale 1ns / 1ps

module ema_filter_lut #(
    parameter WIDTH = 8
)(
    input  wire clk,
    input  wire reset,
    input  wire [WIDTH-1:0] x_in,
    output reg  [WIDTH-1:0] y_out
);

    wire [15:0] alpha_val;
    wire [15:0] beta_val;

    reg  [WIDTH-1:0] y_prev;

    // LUT ROM instantiation
    ema_lut_alpha alpha_rom(
        .addr(x_in),
        .data(alpha_val)
    );

    ema_lut_beta beta_rom(
        .addr(y_prev),
        .data(beta_val)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            y_prev <= 0;
            y_out  <= 0;
        end
        else begin
            y_out  <= alpha_val + beta_val;
            y_prev <= y_out;
        end
    end

endmodule
