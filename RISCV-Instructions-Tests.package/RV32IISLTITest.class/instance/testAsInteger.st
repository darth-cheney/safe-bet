as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IISLTI new.
	instruction rd setTo: 2r10100.
	instruction rs1 setTo: 2r11110.
	instruction immediateValue: 2r111111111111.
	
	"We expect the integer to be the following:
		2r[111111111111][11110][010][10100][0010011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r11111111111111110010101000010011.
	self assert: expected equals: instruction asInteger.