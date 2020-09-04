I represent an instruction that loads a half-word from memory, and then sign-extends it to 32-bits before storing the value in the register referenced by rd.

The source address is determined by adding the 12-bit sign-extended immediate value to the value referenced by the register rs1.

Though I am an I-type instruction, I am also a Load instruction which has its own opcode separate from other I-types. This is why I subclass RV32IIL and not RV32II directly. See the class comment of RV32IIL for more information.

The RISC-V Spec lists LH as:
[imm1][rs1][funct3][rd][opcode  ]
[imm1][rs1][    001][rd][0000011]