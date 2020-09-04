I represent a "set less than immediate" instruction. If the value in the register referenced by rs1 is less than the sign-extended 12-bit immediate in imm1, I put 1 into the register referenced by rs. Otherwise, I set the register referenced by rd to 0.

*Note that I perform a sign-extended comparison between imm1 and rs1. For the unsigned version, see RV32IISLTIU.

The RISCV Spec lists SLTI as:
[imm1][rs1][010][rd][opcode]
[12     ][5   ][3    ][5  ][7          ]
