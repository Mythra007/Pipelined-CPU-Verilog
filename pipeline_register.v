module IF_ID(
    input clk,
    input [7:0] instruction_in,
    output reg [7:0] instruction_out
);
    always @(posedge clk)
        instruction_out <= instruction_in;
endmodule


// -----------------------------
// ID_EX Pipeline Register
// -----------------------------

module ID_EX(
    input clk,
    input [7:0] op1,
    input [7:0] op2,
    input [1:0] opcode,
    input [1:0] funct,
    output reg [7:0] ex_op1,
    output reg [7:0] ex_op2,
    output reg [1:0] ex_opcode,
    output reg [1:0] ex_funct
);
    always @(posedge clk) begin
        ex_op1 <= op1;
        ex_op2 <= op2;
        ex_opcode <= opcode;
        ex_funct <= funct;
    end
endmodule


// -----------------------------
// EX_MEM Pipeline Register
// -----------------------------

module EX_MEM(
    input clk,
    input [7:0] alu_result,
    input zero,
    input negative,
    output reg [7:0] mem_alu_result,
    output reg mem_zero,
    output reg mem_negative
);
    always @(posedge clk) begin
        mem_alu_result <= alu_result;
        mem_zero <= zero;
        mem_negative <= negative;
    end
endmodule


// -----------------------------
// MEM_WB Pipeline Register
// -----------------------------

module MEM_WB(
    input clk,
    input [7:0] mem_result,
    output reg [7:0] wb_result
);
    always @(posedge clk)
        wb_result <= mem_result;
endmodule
