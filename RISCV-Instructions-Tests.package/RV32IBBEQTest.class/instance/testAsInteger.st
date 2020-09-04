as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IBBEQ new.
	instruction rs1 setTo: 2r10000.
	instruction rs2 setTo: 2r01100.
	instruction immediateValue: 2r1001011101011. "Note: the first bit is ignored"
	
	"We expect the integer to be the following:
		2r[1          ][010111][01100][10000][000][0101 ][0         ][1100011]
		   [imm4   ][imm3   ][rs2     ][rs1     ][fn3 ][imm2][imm1 ][opcode  ]
		   [13        ][6:11     ]                                  [2:5    ][12      ]"
	expected := 2r10101110110010000000010101100011.
	self assert: expected equals: instruction asInteger.