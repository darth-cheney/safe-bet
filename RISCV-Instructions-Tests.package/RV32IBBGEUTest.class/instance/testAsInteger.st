as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IBBGEU new.
	instruction immediateValue: 2r1110100101101. "Note: bit 0 is ignored for these immediates"
	instruction rs1 setTo: 2r01011.
	instruction rs2 setTo: 2r10100.
	
	"We expect the integer to be the following:
		2r[1         ][101001][10100][01011][111][0110    ][1          ][1100011]
		   [imm13][im6:11 ][rs2     ][rs1     ][fn3 ][imm2:5][imm12][ opcode  ]"
	expected := 2r11010011010001011111011011100011.
	self assert: expected equals: instruction asInteger.
	