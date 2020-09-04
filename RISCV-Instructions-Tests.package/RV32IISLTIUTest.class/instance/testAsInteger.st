as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IISLTIU new.
	instruction rd setTo: 2r01001.
	instruction rs1 setTo: 2r00001.
	instruction immediateValue: 13. "2r000000001101"
	
	"We expect the integer to be the following:
		2r[000000001101][00001][011][01001][0010011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00000000110100001011010010010011.
	self assert: expected equals: instruction asInteger.
	
	