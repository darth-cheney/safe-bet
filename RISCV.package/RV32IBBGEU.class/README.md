I represent a branch instruction that compares the values in two registers. If the unsigned value in the register referenced by rs1 is greater than or equal to the unsigned value in the register referenced by rs2, then I take the branch. The 12-bit B-immediate encodes signed offsets in multiples of 2 bytes. The offset is sign-extended and added to the address of the branch instruction to give the target address. The conditional branch range is ±4 KiB.

BGEU stands for "Branch if Greater-than or Equal-to, using Unsigned values"

The RISCV Spec lists BGEU as:
[imm12][imm10:5][   rs2   ][   rs1   ][   111       ][imm4:1][imm11][1100011]  | 0-indexed
[imm12][imm10:5][   rs2   ][   rs1   ][   funct3   ][imm4:1][imm11][opcode  ]
