module systolic_array (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [7:0]  in_a [4],
    input  logic [7:0]  in_b [4],
    output logic [15:0] result [4][4]
);
    logic [7:0] a_wire [4][5];
    logic [7:0] b_wire [5][4];

    genvar i, j;
    generate
        for (i = 0; i < 4; i++) begin : assign_inputs
            assign a_wire[i][0] = in_a[i];
            assign b_wire[0][i] = in_b[i];
        end

        for (i = 0; i < 4; i++) begin : row
            for (j = 0; j < 4; j++) begin : col
                npu_pe pe_inst (
                    .clk(clk),
                    .rst_n(rst_n),
                    .in_a(a_wire[i][j]),
                    .in_b(b_wire[i][j]),
                    .out_a(a_wire[i][j+1]),
                    .out_b(b_wire[j+1][i]),
                    .accum(result[i][j])
                );
            end
        end
    endgenerate
endmodule
