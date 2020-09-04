as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IIANDI new.
	instruction rd setTo: 2r00001. "1"
	instruction rs1 setTo: 2r01111. "15"
	instruction immediateValue: 2r000001011011. "91"
	
	"We expect an integer with the following structure:
		2r[000001011011][01111][111][00001][0010011]
		   [imm1                ][rs1       ][fn3 ][rd       ][opcode   ]"
	expected := 2r00000101101101111111000010010011.
	self assert: 91 equals: instruction immediateValue.
	self assert: expected equals: instruction asInteger.
	 