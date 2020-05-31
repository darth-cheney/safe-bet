I represent an instruction that stores a word (SW) into memory. The destination address is obtained by adding the 12-bit sign-extended offset to the value in the register referenced by rs1. The data is stored is in the register referenced by rs2.

The RISCV Spec lists SW as:
[imm2][rs2][rs1][010][imm1][opcode]
[imm2][rs2][rs1][fn3 ][imm1][opcode]

