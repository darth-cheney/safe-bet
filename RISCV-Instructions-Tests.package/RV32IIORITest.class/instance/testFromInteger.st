as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct OR instruction as an integer, will correctly
	give us an instance of RV32IIORI."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[000101111110][01000][110][00001][0010011]
		   [imm1                ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r00010111111001000110000010010011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IIORI equals: instruction class.