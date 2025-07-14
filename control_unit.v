module control_unit(
    input [1:0] opcode,
    input [1:0] funct,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg alu_src,
    output reg out_en
);
    always @(*) begin
        // Default signals
        reg_write = 0;
        mem_read = 0;
        mem_write = 0;
        alu_src = 0;
        out_en = 0;

        case (opcode)
            2'b00: begin // LOAD
                reg_write = 1;
                mem_read = 1;
                alu_src = 1;
            end
            2'b01: begin // OUT
                out_en = 1;
            end
            2'b10: begin // SPECIAL
                case (funct)
                    2'b00: reg_write = 1; // ADD
                    2'b01: reg_write = 1; // SUB
                    2'b10: ; // COMPARE (no write)
                    2'b11: ; // JUMP (handled elsewhere)
                endcase
            end
        endcase
    end
endmodule