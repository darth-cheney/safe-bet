I represent an instruction that performs a subtraction of the value stored in the register referenced by my rs2 from the value stored in the register referenced by my rs2, storing the result in the register referenced by my rd.

The RISCV Spec lists SUB as:
[0100000][rs2][rs1][    000][rd][0110011]
[funct7    ][rs2][rs1][funct3][rd][  opcode]

Arguments given as an array or ordered collection should be in the asm order, ie reversed from the diagram above -- { rd. rs1. rs2 }