I represent an instruction that sets the register referenced by rd to 1 if the value in the register referenced by rs1 is less than the value in the register referenced by r2. Otherwise, I will tell the CPU to store 0 into the register at rd.

The RISCV Spec lists SLT as:
[0000000][rs2][rs1][    010][rd][0110011]
[funct7    ][rs2][rs1][funct3][rd][  opcode]