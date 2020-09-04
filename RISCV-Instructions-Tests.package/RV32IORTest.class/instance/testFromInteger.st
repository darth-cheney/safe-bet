as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct OR instruction as an integer, will correctly
	give us an instance of RV32IOR."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[0000000][10101][10100][110][00010][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r00000001010110100110000100110011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IOR equals: instruction class.
	self assert: 2r00010 equals: instruction rd asInteger.
	self assert: 2r10100 equals: instruction rs1 asInteger.
	self assert: 2r10101 equals: instruction rs2 asInteger.