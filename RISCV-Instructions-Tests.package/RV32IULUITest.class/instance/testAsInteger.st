as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IULUI new.
	instruction rd setTo: 2r10010.
	instruction immediateValue: 2r111111111111111111101011101011001. "Note: should only take upper 20 bits"
	
	"We expect the integer to be the following:
		2r[11111111111111111101][10010][0110111]
		   [ imm1                              ][rd       ][opcode  ]
		   [ 31:12                              ]                              | 0-indexed"
	expected := 2r11111111111111111101100100110111.
	self assert: expected equals: instruction asInteger.