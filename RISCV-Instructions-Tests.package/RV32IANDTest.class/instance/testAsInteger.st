as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IAND new.
	instruction rd setTo: 2r00010. "2"
	instruction rs1 setTo: 2r10101. "21"
	instruction rs2 setTo: 2r01010. "10"
	
	"We expect the following structure:
		2r[0000000][01010][10101][111][00010][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00000000101010101111000100110011.
	self assert: expected equals: instruction asInteger.