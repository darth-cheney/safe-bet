I represent an instruction that performs a bitwise exclusive or operation on the values referenced by registers rs2 and rs1. I store the result in the register referenced by rd.

The RISCV Spec lists XOR as:
[0000000][rs2][rs1][100][rd][0110011]
[funct7    ][rs2][rs1][fn3 ][rd][opcode  ]
