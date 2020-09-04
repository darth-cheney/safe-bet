as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IILH new.
	instruction rd setTo: 2r01000.
	instruction rs1 setTo: 2r00000.
	instruction immediateValue: 2r0000000010000101010000000000100.
	
	"We expect the integer to be the following:
		2r[000000000100][00000][001][01000][0000011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00000000010000000001010000000011.
	self assert: expected equals: instruction asInteger.
