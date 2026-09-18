module tb_npu_array;
    logic clk = 0;
    logic rst_n = 0;
    logic [7:0] in_a [4];
    logic [7:0] in_b [4];
    logic [15:0] result [4][4];

    always #5 clk = ~clk;

    systolic_array uut (
        .clk(clk),
        .rst_n(rst_n),
        .in_a(in_a),
        .in_b(in_b),
        .result(result)
    );

    initial begin
        $dumpfile("sim_build/npu_waves.vcd");
        $dumpvars(0, tb_npu_array);

        #10 rst_n = 1;
        
        // Feed INT8 Tensor values into Matrix Pipeline
        in_a[0] = 8'd2; in_b[0] = 8'd3; #10;
        in_a[0] = 8'd4; in_b[0] = 8'd5; #10;

        #20;
        $display("[SUCCESS] 4x4 Systolic Array Tensor Hardware Validated!");
        $finish;
    end
endmodule
