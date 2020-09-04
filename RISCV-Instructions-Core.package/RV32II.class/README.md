I am a RISC-V RV32I type I instruction.

I type instructions represent instructions using 3 inputs: two register inputs (destination rd, source rs1) and a 12-bit immediate value called imm1.

*Most* I type instructions have the same opcode: 2r0010011. Note that the "Load" instructions have a different opcode of 2r0000011.

The funct3 values will vary depending on the specific instruction, but they will be static for that instruction.

My general instruction format -- and the parts of which I am composed -- is the following:
31            20 19     15 14         12 11     7 6              0   | zero-index
[ imm1 (12) ][   rs1   ][   funct3   ][   rd   ][   opcode   ]  | part names
[   (12)         ][  (5)     ][  (3)          ][ (5)    ][ (7)            ]  | part sizes

(Note that the above are zero-indexed, as in the RISC-V spec. In my implementation we use the normal 1-indexed Smalltalk style)

Note also that instructions SLLI, SRLI, and SRAI, which all involve shifts with immediates, only fetch the shift amount from the lower 5 bits of the imm1 field.