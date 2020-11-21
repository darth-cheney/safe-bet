I represent an instruction that loads a 64-bit value from memory and puts it into the register referenced by rd. I stand for "load double". I am used only by 64-but xlen systems or higher.
  
The source address is determined by adding the 12-bit sign-extended immediate value to the value referenced by the register rs1.

I am a subclass (and extension) of RV32IIL. See that class comment for more information.

The RISC-V Spec Lists LD as:
[imm1][rs1][funct3 ][rd][opcode ]
[imm1][rs1][    011][rd][0000011]