I represent a FENCE instruction, which is used to order device I/O and memory accesses as viewed by other RISCV harts and external devices or coprocessors.

The RISCV Spec lists FENCE as:
[   fm   ][   predecessor   ][   successor     ][   rs1   ][   funct3   ][   rd   ][   opcode   ]
[   FM   ][PI][PO][PR][ PW][SI][SO][SR][SW][   rs1   ][   funct3   ][   rd   ][   0001111 ]
[ 4        ][1 ][1  ][ 1 ][ 1    ][1][1   ][1  ][1    ][ 5        ][ 3             ][ 5      ][ 7               ]