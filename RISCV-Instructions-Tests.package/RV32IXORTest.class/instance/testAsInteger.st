as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IXOR new.
	instruction rd setTo: 2r00001. "1"
	instruction rs1 setTo: 2r01000. "16"
	instruction rs2 setTo: 2r01111. "15"
	
	"We expect an integer with the following structure:
		2r[0000000][01111][01000][100][00001][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00000000111101000100000010110011.
	self assert: expected equals: instruction asInteger.