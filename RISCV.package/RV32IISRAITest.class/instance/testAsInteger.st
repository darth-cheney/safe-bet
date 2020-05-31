as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IISRAI new.
	instruction rd setTo: 2r00001. "1"
	instruction rs1 setTo: 2r00010. "2"
	instruction shamt setTo: 2r00101.
	instruction imm2 setTo: 2r0100000.
	
	"We expect the integer to be the following:
		2r[0100000][00101][00010][101][00001][0010011]
		   [imm2     ][shamt][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r01000000010100010101000010010011.
	self assert: expected equals: instruction asInteger.
	