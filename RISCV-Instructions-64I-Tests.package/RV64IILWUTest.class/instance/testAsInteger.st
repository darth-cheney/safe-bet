tests
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV64IILWU new.
	instruction rd setTo: 2r00101.
	instruction rs1 setTo: 2r10111.
	instruction immediateValue: 2r1001101001001110110111010. "Should only take first 12"
	
	"We expect the integer to be the following:
		2r[110110111010][10111][110][00101][0000011]
	 	  [imm1        ][rs1  ][fn3][rd   ][opcode ]"
		
	expected := 2r11011011101010111110001010000011.
	self assert: expected equals: instruction asInteger.