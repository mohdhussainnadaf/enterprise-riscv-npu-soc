import rv32_pkg::*;

module rv32_alu (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic [3:0]  alu_ctrl,
    output logic [31:0] result,
    output logic        zero
);
    logic [4:0] shift_amt;
    assign shift_amt = b[4:0];

    always_comb begin
        case (alu_ctrl)
            4'b0000: result = a + b;         // ADD
            4'b0001: result = a - b;         // SUB
            4'b0010: result = a & b;         // AND
            4'b0011: result = a | b;         // OR
            4'b0100: result = a ^ b;         // XOR
            4'b0101: result = a << shift_amt; // SLL
            4'b0110: result = a >> shift_amt; // SRL
            default: result = '0;
        endcase
        zero = (result == 32'b0);
    end
endmodule
