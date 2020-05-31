as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IISRLI new.
	instruction rd setTo: 2r00011. "3"
	instruction rs1 setTo: 2r01010. "10"
	instruction shamt setTo: 2r10011. "19"
	instruction imm2 setTo: 2r1111111. "Should be zeroed out"
	
	"We expect the integer to be the following:
		2r[0000000][10011][01010][101][00011][0010011]
		   [imm2     ][shamt][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00000001001101010101000110010011.
	self assert: expected equals: instruction asInteger.
	