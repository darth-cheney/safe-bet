as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct BNE instruction as an integer, will correctly
	give us an instance of RV32IBBNE."
	| instruction incoming |
	
	"The structure of the incoming integer is: 
		2r[0        ][011100][10010][01011][001][0111 ][0        ][1100011]
		   [imm4 ][imm3   ][rs2     ][rs1     ][fn3 ][imm2][imm1][opcode   ]
		   [13      ][6:11     ]                                  [2:5    ][12      ]"
	incoming := 2r00111001001001011001011101100011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IBBNE equals: instruction class.
	self assert: 2r0 equals: instruction imm4 asInteger.
	self assert: 2r011100 equals: instruction imm3 asInteger.
	self assert: 2r10010 equals: instruction rs2 asInteger.
	self assert: 2r01011 equals: instruction rs1 asInteger.
	self assert: 2r001 equals: instruction funct3 asInteger.
	self assert: 2r0111 equals: instruction imm2 asInteger.
	self assert: 2r0 equals: instruction imm1 asInteger.
	self assert: 2r0001110001110 equals: instruction immediateValue.