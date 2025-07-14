`timescale 1ns/1ps

module testbench;

    reg clk;

    // Instantiate the top module (match the name and port exactly)
    cpu_top CPU (.clk(clk));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stop the simulation after 200ns
    initial begin
        #200 $finish;
    end

endmodule
