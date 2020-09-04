I represent an instruction that performs a bitwise and operation on the values referenced by registers rs1 and rs2. I store the result in the register refereced by rd.

The RISCV Spec lists AND as:
[0000000][rs2][rs1][    111][rd][0110011]
[funct7    ][rs2][rs1][funct3][rd][  opcode]

Arguments given as an array or ordered collection should be in the asm order, ie reversed from the diagram above -- { rd. rs1. rs2 }
