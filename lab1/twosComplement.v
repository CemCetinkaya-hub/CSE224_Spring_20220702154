
module twos_comp_proj (
    input  [7:0] in,
    output [7:0] out
);

assign out = ~in + 1;

endmodule
