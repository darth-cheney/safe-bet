I represent a Load Upper Immediate (LUI) instruction. I am used to build 32-bit constants. I place my upper immediate value in the top 20 bits of the register referenced by rd, filling the lowest 12 bits with zeroes.

I am a U-type instruction.

The RISC-V Spec lists LUI as:
[   imm1   ][   rd   ][   opcode   ]
[ 31:12     ][   rd   ][ 0110111   ] | immediates are 0-indexed here