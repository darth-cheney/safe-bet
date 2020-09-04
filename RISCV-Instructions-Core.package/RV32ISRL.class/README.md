I represent an instruction that performs a logical right shift on the value in the register linked to my rs1 by the shift amount held in the lower 5 bits of the register linked to my rs2. The result will be stored into the register linked to my rd.

The RISCV Spec lists SRL as:
[0000000][rs2][rs1][    101][rd][0110011]
[funct7    ][rs2][rs1][funct3][rd][  opcode]
