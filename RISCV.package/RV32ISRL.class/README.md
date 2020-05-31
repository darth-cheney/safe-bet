I represent an instruction that performs a logical right shift on the value in the register linked to my rs1 by the shift amount held in the lower 5 bits of the register linked to my rs2. The result will be stored into the register linked to my rd.

The RISCV Spec lists SRL as:
[0000000][rs2][rs1][    101][rd][0110011]
[funct7    ][rs2][rs1][funct3][rd][  opcode]

To set my target register (rs1) using a RVRegister instance, use #targetRegister:
To set my shift amount register using a RVRegister instance, use #shiftAmountRegister:
To set my destination register using a RVRegister instance, use #destinationRegister:

Arguments given as an array or ordered collection should be in the asm order, ie reversed from the diagram above -- { rd. rs1. rs2 }