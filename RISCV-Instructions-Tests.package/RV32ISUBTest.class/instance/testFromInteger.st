as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SUB instruction as an integer, will correctly
	give us an instance of RV32ISUB."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[0100000][11000][00111][000][00001][0110011]
		   [ funct7   ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r01000001100000111000000010110011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32ISUB equals: instruction class.
	self assert: 2r11000 equals: instruction rs2 asInteger.
	self assert: 2r00111 equals: instruction rs1 asInteger.
	self assert: 2r00001 equals: instruction rd asInteger.