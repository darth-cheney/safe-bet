I represent a 64-bit extension instruction that loads a 32-bit value from memory and zero-extends it to be 64bits. I stand for "load word unsigned".

The source address is determined by adding the 12-bit sign-extended immediate value to the value referenced by the register rs1.

I am a subclass (and extension of) RV32IIL.

The RISC-V Spec lists LWU as:
[imm1][rs1][funct3][rd][opcode  ]
[imm1][rs1][    110][rd][0000011]