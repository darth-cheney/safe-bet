as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction expected |
	instruction := RV32IIORI new.
	instruction rd setTo: 2r10000. "16"
	instruction rs1 setTo: 2r01010. "10"
	instruction immediateValue: 7. "2r000000000111"
	
	"We expect the integer to be the following:
		2r[000000000111][01010][110][10000][0010011]
               [imm1                ][rs1     ][fn3 ][rd       ][opcode   ]"
	expected := 2r00000000011101010110100000010011.
	self assert: expected equals: instruction asInteger.	