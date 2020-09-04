as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IBBGE new.
	instruction rs2 setTo: 2r11111.
	instruction rs1 setTo: 2r01000.
	instruction immediateValue: 2r0111111110110. "Note: first bit is ignored"
	
	"We expect the integer to be the following:
		2r[0          ][111111][11111][01000][101][1011 ][1         ][1100011]
		   [imm4   ][imm3   ][rs2     ][rs1     ][fn3 ][imm2][imm1  ][opcode  ]
		   [13        ][6:11     ]                                 [2:5     ][12       ]"
	expected := 2r01111111111101000101101111100011.
	self assert: expected equals: instruction asInteger.