tests
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV64IILD new.
	instruction rd setTo: 2r01001. "9"
	instruction rs1 setTo: 2r00111. "7"
	instruction immediateValue: 2r1110111010111101001001. "Should only take lower 12"
	
	"We expect the integer to be the following:
		2r[111101001001][00111][011][01001][0000011]
		  [imm1        ][rs1  ][fn3][rd   ][opcode ]"
		
	expected := 2r11110100100100111011010010000011.
	self assert: expected equals: instruction asInteger.