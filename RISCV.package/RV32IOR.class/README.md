I represent an intstruction that performs a bitwise or on the values referenced by registers rs1 and rs1. I store the result in the register referenced by rd.

The RISCV Spec lists OR as:
[0000000][rs2][rs1][    110][rd][0110011]
[funct7    ][rs2][rs1][funct3][rd][  opcode]




