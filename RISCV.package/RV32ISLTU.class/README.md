I represent an instruction that performs an unsigned comparison, writing 1 to the register referenced by rd if:
the value in the register referenced by rs1 is  less than (<) the value in the register referenced by rs2.
Otherwise, I write 0 to the register referenced by rd.

Note that SLTU is the unsigned variant of SLT.

See this info from the RISCV Spec: "Note, 'SLTU rd, x0 rs2' sets rd to 1 if rs2 is not equal to zero, otherwise sets rd to 0 (assembler pseudoinstruction SNEZ rd, rs)"

The RISCV Spec lists SLTU as:
[0000000][rs2][rs1][011][rd][0110011]
[funct7    ][rs2][rs1][fn3 ][rd][opcode  ]


