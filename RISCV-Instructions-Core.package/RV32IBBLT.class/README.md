I represent a branch instruction that compares the values in two registers. If the signed value in the register referenced by rs1 is less than the signed value in the register referenced by rs2, then I take the branch. The 12-bit B-immediate encodes signed offsets in multiples of 2 bytes. The offset is sign-extended and added to the address of the branch instruction to give the target address. The conditional branch range is ±4 KiB.

BLT stands for "Branch if Less-than (using signed values)"

The RISCV Spec lists BLTU as:
[imm12][imm10:5][   rs2   ][   rs1   ][   100       ][imm4:1][imm11][1100011]  | 0-indexed
[imm12][imm10:5][   rs2   ][   rs1   ][   funct3   ][imm4:1][imm11][opcode  ]
