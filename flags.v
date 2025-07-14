module flags(
    input [7:0] result,
    output zero,
    output negative
);
    assign zero = (result == 8'b0);
    assign negative = result[7];
endmodule
