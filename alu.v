// alu.v
module alu(
    input [7:0] op1,
    input [7:0] op2,
    input [1:0] func_sel, // 00 = ADD, 01 = SUB, 10 = CMP
    output reg [7:0] result,
    output reg zero,
    output reg sign
);
    always @(*) begin
        case (func_sel)
            2'b00: result = op1 + op2; // ADD
            2'b01: result = op1 - op2; // SUB
            2'b10: result = op1 - op2; // CMP
            default: result = 0;
        endcase

        zero = (result == 0);
        sign = result[7]; // MSB = 1 means negative in 2's comp
    end
endmodule
