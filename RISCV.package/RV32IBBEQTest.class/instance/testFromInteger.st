as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct BEQ instruction as an integer, will correctly
	give us an instance of RV32IBBEQ."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[0          ][010101][11100][10100][000][0101 ][1         ][1100011]
		   [imm4   ][imm3   ][rs2     ][rs1     ][fn3 ][imm2][imm1 ][opcode  ]
		   [13        ][6:11     ]                                  [2:5    ][12      ]"
	incoming := 2r00101011110010100000010111100011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IBBEQ equals: instruction class.
	self assert: 2r0 equals: instruction imm4 asInteger.
	self assert: 2r010101 equals: instruction imm3 asInteger.
	self assert: 2r11100 equals: instruction rs2 asInteger.
	self assert: 2r10100 equals: instruction rs1 asInteger.
	self assert: 2r000 equals: instruction funct3 asInteger.
	self assert: 2r0101 equals: instruction imm2 asInteger.
	self assert: 2r1 equals: instruction imm1 asInteger.
	self assert: 2r0101010101010 equals: instruction immediateValue.