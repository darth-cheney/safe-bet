as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32ISSB new.
	instruction rs1 setTo: 2r11001.
	instruction rs2 setTo: 2r00100.
	instruction immediateValue: 2r100000010001.
	
	"We expect the integer to be the following:
		2r[1000000][00100][11001][000][10001][0100011]
		   [imm2     ][rs2     ][rs1     ][fn3 ][imm1 ][opcode  ]"
	expected := 2r10000000010011001000100010100011.
	self assert: expected equals: instruction asInteger.
	