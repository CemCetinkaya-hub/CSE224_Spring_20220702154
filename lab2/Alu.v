`timescale 1ns / 1ps

module lab_2project (
    input [7:0] x,
    input [7:0] y,
    input [2:0] opcode,
    output reg [7:0] z
);

always @(*)
 begin
    case (opcode)
    3'b000: z = ~x;
    3'b001: z = x | y;
    3'b010: z = x ^ y;
    3'b011: z = x & y;
    3'b100: z = x[3:0] * y[3:0];
    3'b101: z = x + y;
    3'b110: z = x - y;
    default: z = 8'b00000000;
    endcase
 end

endmodule
