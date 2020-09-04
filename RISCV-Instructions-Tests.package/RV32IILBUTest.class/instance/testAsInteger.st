as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IILBU new.
	instruction rd setTo: 2r11101.
	instruction rs1 setTo: 2r01100.
	instruction immediateValue: 2r1111111111010100011100011.
	
	"We expect the integer to be the following:
		2r[100011100011][01100][100][11101][0000011]
		    [imm1              ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r10001110001101100100111010000011.
	self assert: expected equals: instruction asInteger.