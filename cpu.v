module cpu_top(
    input clk
);
    wire [7:0] instruction, read_data1, read_data2, alu_result, mem_data_out, out_val;
    wire zero_flag, neg_flag;
    wire [1:0] opcode, funct;
    wire reg_write, mem_read, mem_write, alu_src, out_en;

    reg [7:0] pc = 0;
    reg [7:0] register_file [0:7];

    // Fetch
    reg [7:0] instruction_memory [0:255];
    initial $readmemh("program.txt", instruction_memory);
    assign instruction = instruction_memory[pc];

    // Decode
    assign opcode = instruction[7:6];
    assign funct = instruction[5:4];
    wire [2:0] rs = instruction[3:1];
    wire [2:0] rt = instruction[2:0];

    assign read_data1 = register_file[rs];
    assign read_data2 = register_file[rt];

    // Control
    control_unit CU(opcode, funct, reg_write, mem_read, mem_write, alu_src, out_en);

    // Execute
    assign alu_result = (funct == 2'b00) ? (read_data1 + read_data2) :
                        (funct == 2'b01) ? (read_data1 - read_data2) :
                        8'b0;

    flags FLAGS(alu_result, zero_flag, neg_flag);

    // Memory
    data_memory DM(clk, alu_result, read_data2, mem_write, mem_read, mem_data_out);

    // Writeback
    always @(posedge clk) begin
        if (reg_write)
            register_file[rs] <= alu_result;
        pc <= pc + 1;
    end

    // Output
    output_module OUT(alu_result, out_en, out_val);
endmodule

