module instruction_memory(
    input [7:0] address,
    output reg [7:0] instruction
);

    reg [7:0] memory[0:255];

    initial begin
        // Program:
        // LOAD R1, 5
        memory[0] = 8'b000000101; // opcode: 00, rx: 001 (R1), ry: 101 (5)
        // LOAD R2, 3
        memory[1] = 8'b000010011; // opcode: 00, rx: 010 (R2), ry: 011 (3)
        // CMP R2
        memory[2] = 8'b100010010; // opcode: 10, rx: 010 (CMP), ry: 010 (R2)
        // JUMP GT to addr 6
        memory[3] = 8'b110000110; // opcode: 11, rx: 000 (GT), ry: 110 (6)
        // JUMP LT to addr 8
        memory[4] = 8'b110001000; // opcode: 11, rx: 001 (LT), ry: 1000 (8)
        // JUMP EQ to addr 8
        memory[5] = 8'b110010000; // opcode: 11, rx: 010 (EQ), ry: 1000 (8)
        // ADD R1 and R2
        memory[6] = 8'b100000010; // opcode: 10, rx: 000 (ADD), ry: 010 (R2)
        // OUTPUT R3 (Adder output assumed saved in R3)
        memory[7] = 8'b010011000; // opcode: 01, rx: 011 (R3)
        // SUB R1 and R2
        memory[8] = 8'b100001010; // opcode: 10, rx: 001 (SUB), ry: 010 (R2)
        // OUTPUT R4 (Sub output assumed saved in R4)
        memory[9] = 8'b010100000; // opcode: 01, rx: 100 (R4)
        // HALT (custom - treated as zeroed instruction)
        memory[10] = 8'b00000000;
    end

    always @(*) begin
        instruction = memory[address];
    end
endmodule
