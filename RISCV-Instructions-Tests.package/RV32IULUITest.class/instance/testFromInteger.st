as yet unclassified
testFromInteger
	"Ensure that RVInstruction  class >> #fromInteger:, when
	given a correct LUI instruction as an integer, will correctly
	give us an instance of RV32IULUI"
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[11001111101100011101][10101][0110111]
		   [ imm1                              ][rd       ][opcode  ]
		   [ 31:12                              ]                              | 0-indexed"
	incoming := 2r11001111101100011101101010110111.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IULUI equals: instruction class.
	self assert: 2r11001111101100011101 equals: instruction imm1 asInteger.
	self assert: 2r10101 equals: instruction rd asInteger.