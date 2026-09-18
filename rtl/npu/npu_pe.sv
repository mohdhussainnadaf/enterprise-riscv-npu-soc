module npu_pe (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [7:0]  in_a,
    input  logic [7:0]  in_b,
    output logic [7:0]  out_a,
    output logic [7:0]  out_b,
    output logic [15:0] accum
);
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_a <= '0;
            out_b <= '0;
            accum <= '0;
        end else begin
            out_a <= in_a;
            out_b <= in_b;
            accum <= accum + (in_a * in_b);
        end
    end
endmodule
