as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IILB new.
	instruction rd setTo: 2r10100.
	instruction rs1 setTo: 2r11111.
	instruction immediateValue: 2r000000000001111001000101101011.
	
	"We expect the integer to be the following:
		2r[000101101011][11111][000][10100][0000011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00010110101111111000101000000011.
	self assert: expected equals: instruction asInteger.