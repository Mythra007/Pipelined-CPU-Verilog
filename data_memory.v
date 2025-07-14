module data_memory(
    input clk,
    input [7:0] address,
    input [7:0] write_data,
    input mem_write,
    input mem_read,
    output reg [7:0] read_data
);

    reg [7:0] memory [0:255]; // 256-byte memory

    always @(posedge clk) begin
        if (mem_write)
            memory[address] <= write_data;
    end

    always @(*) begin
        if (mem_read)
            read_data = memory[address];
        else
            read_data = 8'b0;
    end

endmodule