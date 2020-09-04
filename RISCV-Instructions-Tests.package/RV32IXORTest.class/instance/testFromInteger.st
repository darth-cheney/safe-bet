as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct XOR instruction as an integer, will correctly
	give us an instance of RV32IXOR"
	| instruction incoming |
	
	"The structure of the incoming is as follows:
		2r[0000000][01010][10101][100][00010][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r00000000101010101100000100110011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IXOR equals: instruction class.
	self assert: 2r01010 equals: instruction rs2 asInteger.
	self assert: 2r10101 equals: instruction rs1 asInteger.
	self assert: 2r00010 equals: instruction rd asInteger.
	
	