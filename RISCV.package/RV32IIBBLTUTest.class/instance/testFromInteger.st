as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct BLTU instruction as an integer, will correctly
	give us an instance of RV32IBBLTU."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[1        ][011011][10100][00010][110][1111 ][1        ][1100011]
		   [imm4 ][imm3   ][rs2     ][rs1     ][fn3 ][imm2][imm1][opcode   ]
		   [13      ][6:11     ]                                  [2:5    ][12      ]"
	incoming := 2r10110111010000010110111111100011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IBBLTU equals: instruction class.
	self assert: 2r1 equals: instruction imm4 asInteger.
	self assert: 2r011011 equals: instruction imm3 asInteger.
	self assert: 2r10100 equals: instruction rs2 asInteger.
	self assert: 2r00010 equals: instruction rs1 asInteger.
	self assert: 2r110 equals: instruction funct3 asInteger.
	self assert: 2r1111 equals: instruction imm2 asInteger.
	self assert: 2r1 equals: instruction imm1 asInteger.
	self assert: 2r1101101111110 equals: instruction immediateValue.