I represent an instruction that stores a byte (SB) into memory. The destination address is obtained by adding the 12-bit sign-extended offset to the value in the register referenced by rs1. The data is stored in the register referenced by rs2.

The RISCV Spec lists SB as:
[imm2][rs2][rs1][000][imm1][opcode]
[imm2][rs2][rs1][fn3 ][imm1][opcode]
