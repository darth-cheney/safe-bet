as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IIADDI new.
	instruction rd setTo: 2r00011.
	instruction rs1 setTo: 2r11101.
	instruction immediateValue: 2r111001100111.
	
	"We expect the integer to be the following: 
		2r[111001100111][11101][000][00011][0010011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r11100110011111101000000110010011.
	self assert: expected equals: instruction asInteger.