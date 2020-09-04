I represent an instruction that performs an arithmetic right shift on the value in the register referenced by rs1. The shift amount is the value stored in the lower 5 bits of the register referenced by rs2. I store the result in the register referenced by rd.

The RISCV Spec lists SRA as the following:
[0100000][rs2][rs1][101][rd][0110011]
[funct7    ][rs2][rs1][fn3 ][rd][opcode  ]



