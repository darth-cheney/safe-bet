as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IILW new.
	instruction rd setTo: 2r00010.
	instruction rs1 setTo: 2r10011.
	instruction immediateValue: 2r11111111111100011001101.
	
	"We expect the integer to be the following:
		2r[100011001101][10011][010][00010][0000011]
		   [imm1               ][rs1     ][fn3 ][rd      ][opcode   ]"
	expected := 2r10001100110110011010000100000011.
	self assert: expected equals: instruction asInteger.