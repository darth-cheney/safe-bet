I represent an instruction that Adds the Upper Immediate to the Program Counter (AUIPC) for a 32-bit offset from my 20-bit (upper) immediate value, filling in the lowest  12 bits with zeroes. I then add this offset to the address of myself (the address of the given AUIPC instruction), then place the result in the register referenced by rd.

The RISCV Spec lists AUIPC as:
[   imm1   ][   rd   ][   opcode   ]
[ 31:12     ][   rd   ][   opcode   ] | 0-indexed
