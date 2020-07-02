I represent a "set less than immediate" instruction. I will place a 1 in the register referenced by rd if and only if the value in the register referenced by rs1 is less than my set 12-bit immediate value. Otherwise I put a 0 into the register referenced by rd.

*Note that I compare both values as if they are unsigned. For the sign-extended version, see RV32IISLTI instead. OR as the spec says:
SLTIU is similar [to SLTI] but compares the values as unsigned numbers (i.e., the immediate is first sign-extended to XLEN bits then treated as an unsigned number)

The RISCV Spec lists SLTUI as:
[imm1][rs1][011][rd][opcode]
[12     ][5   ][3    ][5 ][7          ]
