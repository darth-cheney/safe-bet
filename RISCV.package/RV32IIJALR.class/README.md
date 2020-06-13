I represent an instruction that performs an indirect jump while linking a target register.

The target address is obtained by adding the sign-extended 12-bit I-immediate to the register rs1, then setting
the least-significant bit of the result to zero. The address of the instruction following the jump (pc+4) is written to register rd. Register x0 can be used as the destination if the result is not required.

The RISCV Spec lists JALR as:
[   imm1   ][   rs1   ][   000       ][   rd   ][1100111    ]
[   imm1   ][   rs1   ][   funct3   ][   rd   ][   opcode   ]

