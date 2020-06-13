as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IBBLTU new.
	instruction rs1 setTo: 2r11100.
	instruction rs2 setTo: 2r10111.
	instruction immediateValue: 2r0111101011101. "Note: first bit is ignored"
	
	"We expect the integer to be the following:
		2r[0         ][111010  ][10111][11100][110][1110    ][1          ][1100011]
		   [imm13][imm6:11][rs2     ][rs1     ][fn3 ][imm2:5][imm12][opcode   ]"
	expected := 2r01110101011111100110111011100011.
	self assert: expected equals: instruction asInteger.