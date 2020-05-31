as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IOR new.
	instruction rd setTo: 2r00100. "4"
	instruction rs1 setTo: 2r01100. "12"
	instruction rs2 setTo: 2r10000. "16"
	
	"We expect an integer with the following structure:
		2r[0000000][10000][01100][110][00100][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00000001000001100110001000110011.
	self assert: expected equals: instruction asInteger.
	