package rv32_pkg;
    typedef enum logic [6:0] {
        OPCODE_OP     = 7'b0110011, // R-type (ADD, SUB)
        OPCODE_OP_IMM = 7'b0010011, // I-type (ADDI)
        OPCODE_LOAD   = 7'b0000011, // Loads
        OPCODE_STORE  = 7'b0100011, // Stores
        OPCODE_VECTOR = 7'b1110111  // Custom NPU Vector Instruction
    } opcode_e;

    typedef struct packed {
        logic [6:0]  funct7;
        logic [4:0]  rs2;
        logic [4:0]  rs1;
        logic [2:0]  funct3;
        logic [4:0]  rd;
        opcode_e     opcode;
    } r_type_t;
endpackage
