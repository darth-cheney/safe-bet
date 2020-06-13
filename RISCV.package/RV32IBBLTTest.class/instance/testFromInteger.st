as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct BLT instruction as an integer, will correctly
	give us an instance of RV32IBBLT."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[1        ][001010][10110][01010][100][1011 ][0        ][1100011]
		   [imm4 ][imm3   ][rs2     ][rs1     ][fn3 ][imm2][imm1][opcode   ]
		   [13      ][6:11     ]                                  [2:5    ][12      ]"
	incoming := 2r10010101011001010100101101100011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IBBLT equals: instruction class.
	self assert: 2r1 equals: instruction imm4 asInteger.
	self assert: 2r001010 equals: instruction imm3 asInteger.
	self assert: 2r10110 equals: instruction rs2 asInteger.
	self assert: 2r01010 equals: instruction rs1 asInteger.
	self assert: 2r100 equals: instruction funct3 asInteger.
	self assert: 2r1011 equals: instruction imm2 asInteger.
	self assert: 2r0 equals: instruction imm1 asInteger.
	self assert: 2r1000101010110 equals: instruction immediateValue.