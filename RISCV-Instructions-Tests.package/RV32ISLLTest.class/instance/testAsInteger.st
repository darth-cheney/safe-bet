as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32ISLL new.
	instruction rd setTo: 2r00011. "3"
	instruction rs1 setTo: 2r00001. "1"
	instruction rs2 setTo: 2r00111. "7"
	
	"We expect an integer with the following structure:
		2r[0000000][00111][00001][001][00011][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00000000011100001001000110110011.
	self assert: expected equals: instruction asInteger.