I represent a Jump And Link (JAL) instruction. My immediate value is a signed offset in multiples of two bytes. The offset is sign-extended and added to the address of the jump instruction to form the jump target address. Jumps can therefore target a ±1 MiB range. JAL stores the address of the instruction following the jump (pc+4) into register rd. The standard software calling convention uses x1 as the return address register and x5 as an alternate link register. 

I am a J-type instruction. For now, I am the only instruction of the J-type.


The RISCV Spec lists JAL as:
[   imm4   ][   imm3   ][   imm2   ][   imm1   ][   rd   ][   opcode   ]
[ 20          ][ 10:1       ][ 11           ][ 19:12     ][   rd   ][1101111    ] | 0-indexed immediates