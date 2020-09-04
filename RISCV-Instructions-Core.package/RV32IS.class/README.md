I am a RISC-V RV32I type S instruction.

S-type instructions represent instructions using 4 part inputs: 2 register inputs (rs1 and rs2) and a 12-bit immediate value divided into parts of size 5 (imm1) and 7 (imm2).

S-type instructions concern the storing of values in memory.

My general instruction format -- and the parts of which I am composed -- is the folllowing:
31           25 24    20 19  15 14       12 11             7  6            0   | zero-index
[ imm2 (7) ][   rs2  ][  rs1  ][  funct3  ][  imm1 (5)  ][  opcode  ] | part names
[ (7)           ][ (5)     ][ (5)   ][(3)          ][ (5)             ][ (7)           ] | part sizes

(Note that the above are zero-indexed, as the in RISC-V spec. In my implementation we use the normal 1-indexed Smalltalk style)

