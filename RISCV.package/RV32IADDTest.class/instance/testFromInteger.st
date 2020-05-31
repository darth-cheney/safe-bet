as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct ADD instruction as an integer, will correctly
	give us an instance of RV32IADD."
	| result incoming |
	
	"Incoming is a correct ADD, organized as follows:
		2r[0000000][00101][00000][000][0110011]
		   [ funct7    ][rs2    ][rs1     ][fn3 ][ opcode  ]"
	incoming := 2r000000000101000000000110011.
	result := RVInstruction fromInteger: incoming.
	self assert: RV32IADD equals: result class.
	
	