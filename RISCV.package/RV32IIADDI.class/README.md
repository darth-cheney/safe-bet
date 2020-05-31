I represent an instruction that ADDs the value referenced by register rs1 to the 12-bit sign-extended immediate value in imm1.

Note that arithmetic overflow is ignored, and the result is simply the low XLEN (integer size) bits of the result.

The RISCV Spec lists ADDI as:
[imm1][rs1][000][rd][opcode]
[imm1][rs1][fn3 ][rd][opcode]
[12     ][5   ][3    ][5  ][7         ]
