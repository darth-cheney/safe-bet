as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IIXORI new.
	instruction rd setTo: 2r00001.
	instruction rs1 setTo: 2r10100.
	instruction immediateValue: 50. "2r000000110010" 
	
	"We expect the integer to be the following:
		2r[000000110010][10100][100][00001][0010011]
		   [imm1               ][rs1     ][fn3 ][rd      ][opcode   ]"
	expected := 2r00000011001010100100000010010011.
	self assert: expected equals: instruction asInteger.