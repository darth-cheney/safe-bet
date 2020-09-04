as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IISLLI new.
	instruction rd setTo: 2r10001. "17"
	instruction rs1 setTo: 2r00011. "3"
	instruction shamt setTo: 2r00111. "7"
	instruction imm2 setTo: 2r1111111. "Should be overwritten"
	
	"We expect the integer to be the following:
		2r[0000000][00111][00011][001][10001][0010011]"
	expected := 2r00000000011100011001100010010011.
	self assert: expected equals: instruction asInteger.