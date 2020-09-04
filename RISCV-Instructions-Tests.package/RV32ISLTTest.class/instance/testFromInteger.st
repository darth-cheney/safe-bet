as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SLT instruction as an integer, will correctly
	give us an instance of RV32ISLT."
	| instruction incoming |
	
	"The structure is as follows:
		2r[0000000][00111][11000][010][00001][0110011]
		   [ funct7   ][rs2     ][rs1      ][fn3][rd       ][ opcode ]"
	incoming := 2r00000000011111000010000010110011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32ISLT equals: instruction class.