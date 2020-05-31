I represent an instruction that stores a half-word (SH) into memory. The destination address is obtained by adding the 12-bit sign-extended offset to the value in the register referenced by rs1. The data is stored is in the register referenced by rs2.

The RISCV Spec lists SH as:
[imm2][rs2][rs1][001][imm1][opcode]
[imm2][rs2][rs1][fn3 ][imm1][opcode]
