// program_counter.v
module program_counter(
    input clk,
    input reset,
    input [7:0] jump_address,
    input jump_enable,
    output reg [7:0] pc_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 0;
        else if (jump_enable)
            pc_out <= jump_address;
        else
            pc_out <= pc_out + 1;
    end
endmodule
