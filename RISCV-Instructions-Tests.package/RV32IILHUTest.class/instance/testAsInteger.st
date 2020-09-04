as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IILHU new.
	instruction rd setTo: 2r11111.
	instruction rs1 setTo: 2r10100.
	instruction immediateValue: 2r11111000000100000011111101110111.
	
	"We expect the integer to be the following:
		2r[111101110111][10100][101][11111][0000011]
		    [imm1              ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r11110111011110100101111110000011.
	self assert: expected equals: instruction asInteger.