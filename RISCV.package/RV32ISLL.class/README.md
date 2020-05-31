I represent an instruction that performs a logical left shift on the value referenced by my rs1. The shift about will be the lower 5 bits of the value referenced by rs2. The result will be stored in the register referenced by rd.

The RISCV Spec lists SLL as:
[0000000][rs2][rs1][001][rd][0110011]
[funct7    ][rs2][rs1][fn3 ][rd][opcode  ]

Arguments given as an array or ordered collection should be in the asm order, ie reversed from the diagram above -- { rd. rs1. rs2 }


