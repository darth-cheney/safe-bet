I represent an instruction that performs an addition of the value stored in the register referenced by my rs1 and the value stored in the register referenced by by rs2. The result will be stored in the register referenced by my rd.

The RISCV Spec lists ADD as:
[0000000][rs2][rs1][    000][rd][0110011]
[funct7    ][rs2][rs1][funct3][rd][  opcode]

Arguments given as an array or ordered collection should be in the asm order, ie reversed from the diagram above -- { rd. rs1. rs2 }
