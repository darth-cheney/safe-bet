as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IBBNE new.
	instruction rs2 setTo: 2r11111.
	instruction rs1 setTo: 2r00001.
	instruction immediateValue: 2r1010111010101. "Note: first bit is ignored"
	
	"We expect the integer to be the following:
		2r[1           ][101110][11111][00001][001][1010 ][0        ][1100011]
		   [imm4    ][imm3   ][rs2     ][rs1     ][fn3 ][imm2][imm1][opcode   ]
		   [13         ][6:11     ]                                 [2:5     ][12     ]"
	expected := 2r11011101111100001001101001100011.
	self assert: expected equals: instruction asInteger.