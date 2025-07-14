module output_module(
    input [7:0] in_data,
    input out_en,
    output reg [7:0] out_data
);

    always @(*) begin
        if (out_en)
            out_data = in_data;
        else
            out_data = 8'bz;
    end

endmodule