I represent an instruction that performs an arithmetic right shift on the value referenced by register rs1 by an amount set to the immediate imm1 (alias: shamt). I store the result in the register referenced by rd.

NOTE: SRAI, SRLI, and SLLI are all "variants" of the I-type instruction, according to the RISC-V Spec. The key difference is that instead of a single, 12-bit immediate value at the end of the instruction, only the first five bits reference the shift amount. The remaining 7 bits are all zero except the 31st bit, which is used (in part) to determine the type of immediate shift to perform.

Unlike other I-type instructions, we therefore break up imm1 into shamt/imm1 (size 5) and imm2 (size 7).

The RISCV Spec lists SRAI as:
[0100000][shamt][rs1][101][rd][opcode]
[imm2     ][imm1 ][rs1][fn3 ][rd][opcode]