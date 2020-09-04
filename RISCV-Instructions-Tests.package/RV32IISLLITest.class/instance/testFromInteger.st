as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct OR instruction as an integer, will correctly
	give us an instance of RV32IISRLI."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[0000000][00111][10100][001][00001][0010011]
		   [imm2     ][shamt][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r00000000011110100001000010010011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IISLLI equals: instruction class.
	self assert: 2r00111 equals: instruction shamt asInteger.
	self assert: 2r0000000 equals: instruction imm2 asInteger.