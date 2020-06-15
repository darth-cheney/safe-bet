as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct JAL instruction as an integer, will correctly
	give us an instance of RV32IJJAL."
	| instruction incoming |
	

	"The structure of the incoming integer is:
		2r[0       ][0000111001][1       ][10011011][10101][1101111]
		   [imm4][imm3           ][imm2][imm1       ][rd      ][opcode  ]
		   [20     ][10:1             ][11      ][19:12       ]                           | 0-indexed"
	incoming := 2r00000111001110011011101011101111.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IJJAL equals: instruction class.
	self assert: 2r0 equals: instruction imm4 asInteger.
	self assert: 2r0000111001 equals: instruction imm3 asInteger.
	self assert: 2r1 equals: instruction imm2 asInteger.
	self assert: 2r10011011 equals: instruction imm1 asInteger.
	self assert: 2r010011011100001110010 equals: instruction immediateValue.
	self assert: 2r10101 equals: instruction rd asInteger.
	