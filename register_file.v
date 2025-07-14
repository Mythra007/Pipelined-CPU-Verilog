// register_file.v
module register_file(
    input clk,
    input we,
    input [2:0] read_addr1,
    input [2:0] read_addr2,
    input [2:0] write_addr,
    input [7:0] write_data,
    output [7:0] read_data1,
    output [7:0] read_data2
);
    reg [7:0] registers [0:7];

    assign read_data1 = registers[read_addr1];
    assign read_data2 = registers[read_addr2];

    always @(posedge clk) begin
        if (we)
            registers[write_addr] <= write_data;
    end
endmodule
