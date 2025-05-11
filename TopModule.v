module ZeroToFiveCounter (
    input wire clk,
    input wire rst,
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'd0;
    end else begin
        case (count)
            4'd4: count <= 4'd0;
            default: count <= count + 1;
        endcase
    end
end

endmodule

module SevenSegmentDecoder (
    input [3:0] digit,
    output reg [6:0] seg
);

always @(*) begin
    case (digit)
        4'd0: seg = 7'b1000000;
        4'd1: seg = 7'b1111001;
        4'd2: seg = 7'b0100100;
        4'd3: seg = 7'b0110000;
        4'd4: seg = 7'b0011001;
        default: seg = 7'b1111111;
    endcase
end

endmodule

module TopModule (
    input wire clk,
    input wire rst_btn,
    output wire [6:0] seg
);

wire [3:0] current_count;

ZeroToFiveCounter counter_inst (
    .clk(clk),
    .rst(rst_btn),
    .count(current_count)
);

SevenSegmentDecoder decoder_inst (
    .digit(current_count),
    .seg(seg)
);

endmodule
