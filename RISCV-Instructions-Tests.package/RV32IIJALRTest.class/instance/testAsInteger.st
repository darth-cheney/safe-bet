as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IIJALR new.
	instruction rd setTo: 2r01100.
	instruction rs1 setTo: 2r10000.
	instruction immediateValue: 2r10011010111010011011. "Only takes lower 12 bits"
	
	"We expect the integer to be the following:
		2r[111010011011][10000][000][01100][1100111]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r11101001101110000000011001100111.
	self assert: expected equals: instruction asInteger.