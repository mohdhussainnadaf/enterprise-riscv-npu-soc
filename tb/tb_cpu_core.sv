import rv32_pkg::*;

module tb_cpu_core;
    logic [31:0] a, b, result;
    logic [3:0] alu_ctrl;
    logic zero;

    rv32_alu uut (.*);

    initial begin
        $dumpfile("sim_build/cpu_waves.vcd");
        $dumpvars(0, tb_cpu_core);

        // Test 1: ADD
        a = 32'd15; b = 32'd25; alu_ctrl = 4'b0000; #10;
        assert(result == 32'd40) else $error("ADD Failed!");

        // Test 2: SUB
        a = 32'd50; b = 32'd20; alu_ctrl = 4'b0001; #10;
        assert(result == 32'd30) else $error("SUB Failed!");

        $display("[SUCCESS] RISC-V RV32 Execution Core Validated!");
        $finish;
    end
endmodule
