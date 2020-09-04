as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct OR instruction as an integer, will correctly
	give us an instance of RV32IISRAI."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[0100000][00011][10101][101][00001][0010011]
		   [imm2     ][shamt][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r01000000001110101101000010010011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IISRAI equals: instruction class.
	self assert: 2r0100000 equals: instruction imm2 asInteger.
	self assert: 2r00011 equals: instruction shamt asInteger.
	
	