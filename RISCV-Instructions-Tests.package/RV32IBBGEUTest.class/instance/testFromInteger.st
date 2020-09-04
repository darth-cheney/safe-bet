as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct BGEU instruction as an integer, will correctly
	give us an instance of RV32IBBGEU."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[0         ][110110  ][11101][11111][111][1001    ][0          ][1100011]
		   [imm13][imm6:11][rs2     ][rs1     ][fn3 ][imm2:5][imm12][opcode   ]"
	incoming := 2r01101101110111111111100101100011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IBBGEU equals: instruction class.
	self assert: 2r0 equals: instruction imm4 asInteger.
	self assert: 2r110110 equals: instruction imm3 asInteger.
	self assert: 2r11101 equals: instruction rs2 asInteger.
	self assert: 2r11111 equals: instruction rs1 asInteger.
	self assert: 2r111 equals: instruction funct3 asInteger.
	self assert: 2r1001 equals: instruction imm2 asInteger.
	self assert: 2r0 equals: instruction imm1 asInteger.