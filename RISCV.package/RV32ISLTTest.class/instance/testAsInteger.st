as yet unclassified
testAsInteger
	"Ensure that we return an integer as expected"
	| inst |
	inst := RV32ISLT new.
	inst rd setTo: 2r00011. "3"
	inst rs1 setTo: 2r00000. "0"
	inst rs2 setTo: 2r00001.
	
	"We expect the following:
		2r[000000][00001][00000][010][00011][0110011]
			 [funct7]   [rs2    ][rs1     ][fn3 ][rd       ][opcode  ]"
	self assert: 2r00000000000100000010000110110011 equals: inst asInteger.