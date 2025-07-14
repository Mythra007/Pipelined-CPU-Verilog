`timescale 1ns/1ps

module testbench;

    reg clk;
    wire [7:0] pc_out, instruction_out, alu_result_out, out_val_out;
    wire [7:0] reg_rs_out, reg_rt_out;
    wire zero_flag_out, neg_flag_out;

    cpu_top CPU (
        .clk(clk),
        .pc_out(pc_out),
        .instruction_out(instruction_out),
        .alu_result_out(alu_result_out),
        .out_val_out(out_val_out),
        .reg_rs_out(reg_rs_out),
        .reg_rt_out(reg_rt_out),
        .zero_flag_out(zero_flag_out),
        .neg_flag_out(neg_flag_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        #200 $finish;
    end

endmodule
