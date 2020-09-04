I am a RISC-V RV32I type R instruction.

R type instructions represent instructions using 3 inputs (register inputs).

All R type instructions have the same opcode: 2r0110011. the funct7 and funct3 values will vary depending on the specific instruction.


My general instruction format -- and the parts of which I am composed -- is the following:
 
 32     25 24    20  19    15 14      12  11      7  6            0
[ funct7 ][   rs2   ][   rs1   ][  funct3  ][    rd    ][  opcode  ]

(Note that the above are zero-indexed, as in the RISC-V spec. In my implementation we use the normal 1-indexed Smalltalk style)