as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32ISRA new.
	instruction rd setTo: 2r01000. "16"
	instruction rs1 setTo: 2r00110. "6"
	instruction rs2 setTo: 2r00111. "7"
	
	"We expect an integer with the following structure:
		2r[0100000][00111][00110][101][01000][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r01000000011100110101010000110011.
	self assert: expected equals: instruction asInteger.