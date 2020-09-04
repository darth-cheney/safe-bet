as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct AND instruction as an integer, will correctly
	give us an instance of RV32IAND."
	| instruction incoming |
	
	"The structure is as follows:
		2r[0000000][11111][11110][111][00001][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r00000001111111110111000010110011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IAND equals: instruction class.
	self assert: 2r11111 equals: instruction rs2 asInteger.
	self assert: 2r11110 equals: instruction rs1 asInteger.
	self assert: 2r00001 equals: instruction rd asInteger.