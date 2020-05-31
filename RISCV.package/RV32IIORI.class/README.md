I represent an instruction that performs a bitwise OR on the value referenced by register rs1 and the sign-extended 12-bit immediate imm1. I store the result in the register referenced by rd.

The RISCV Spec lists ORI as:
[imm1][rs1][    110][rd][opcode]
[imm1][rs1][funct3][rd][opcode]
