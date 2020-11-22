tests
testAsInteger
	"Ensure that we can accurately represent this instruction
	as an integer"
	| instruction expected |
	instruction := RV64ISSD new.
	instruction rs1 setTo: 2r11101.
	instruction rs2 setTo: 2r10100.
	instruction immediateValue: 2r110110010110.
	
	"We expect the integer to be the following:
		2r[1101100][10100][11101][011][10110][0100011]
		  [imm2   ][rs2  ][rs1  ][fn3][imm1 ][opcode ]"
	expected := 2r11011001010011101011101100100011.
	self assert: expected equals: instruction asInteger