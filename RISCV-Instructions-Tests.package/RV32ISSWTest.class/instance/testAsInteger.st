as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32ISSW new.
	instruction rs1 setTo: 2r10100.
	instruction rs2 setTo: 2r11111.
	instruction immediateValue: 2r110010100110.
	
	"We expect the integer to be the following: 
		2r[1100101][11111][10100][010][00110][0100011]
		   [imm2     ][rs2     ][rs1     ][fn3 ][imm1 ][opcode  ]"
	expected := 2r11001011111110100010001100100011.
	self assert: expected equals: instruction asInteger.
