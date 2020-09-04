as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SW instruction as an integer, will correctly
	give us an instance of RV32ISSW."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[1110111][01000][10111][000][00000][0100011]
		   [imm2     ][rs2     ][rs1     ][fn3 ][imm1 ][opcode  ]"
	incoming := 2r11101110100010111000000000100011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32ISSB equals: instruction class.
	self assert: 2r1110111 equals: instruction imm2 asInteger.
	self assert: 2r00000 equals: instruction imm1 asInteger.
	self assert: 2r01000 equals: instruction rs2 asInteger.
	self assert: 2r10111 equals: instruction rs1 asInteger.
