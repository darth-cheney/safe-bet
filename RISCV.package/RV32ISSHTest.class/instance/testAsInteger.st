as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32ISSH new.
	instruction rs1 setTo: 2r01110.
	instruction rs2 setTo: 2r10010.
	instruction immediateValue: 2r1111111111111111111100011.
	
	"We expect the integer to be the following:
		2r[1111111][10010][01110][001][00011][0100011]
		   [imm2     ][rs2     ][rs1     ][fn3 ][imm1 ][opcode  ]"
	expected := 2r11111111001001110001000110100011.
	self assert: expected equals: instruction asInteger.
	
	
	