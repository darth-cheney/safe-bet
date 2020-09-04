I am an abstract class representing RISC-V RV32I B-type (Branch) instructions.

All branch instructions use the B-type instruction format. The 12-bit B-immediate encodes signed
offsets in multiples of 2 bytes. The offset is sign-extended and added to the address of the branch
instruction to give the target address. The conditional branch range is ±4 KiB.

Note that the immediate value is spread throughout B-type instructions in an out-of-order fashion.
Below is the basic speficiation for B-types:
      31      30           25 24  20 19  15 14      12 11        8       7          6         0 | 0-indexed
[imm(12)][imm(10:5)][  rs2  ][  rs1  ][ funct3 ][imm(4:1)][imm(11)][opcode]

Branch instructions compare two registers. BEQ and BNE take the branch if registers rs1 and rs2
are equal or unequal respectively. BLT and BLTU take the branch if rs1 is less than rs2, using
signed and unsigned comparison respectively. BGE and BGEU take the branch if rs1 is greater
than or equal to rs2, using signed and unsigned comparison respectively. Note, BGT, BGTU,
BLE, and BLEU can be synthesized by reversing the operands to BLT, BLTU, BGE, and BGEU,
respectively.

