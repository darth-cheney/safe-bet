I represent an instruction that stores a double (SD) into memory. I am a 64-bit extension of 32I.

The destination address is obtained by adding the 12-bit sign-extended offset to the value in the register referenced by rs1. The data for the value that will be stored at the memory address is kept in register rs2.
  
The RISC-V Spec lists SD as:
[imm2][rs2][rs1][011][imm1][0100011]
[imm2][rs2][rs1][fn3][imm1][opcode ]