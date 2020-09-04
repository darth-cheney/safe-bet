as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SRA instruction as an integer, will correctly
	give us an instance of RV32ISRA."
	| instruction incoming |
	
	"The structure of the incoming is as follows:
		2r[0100000][11011][00100][101][00010][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r01000001101100100101000100110011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32ISRA equals: instruction class.
	self assert: 2r11011 equals: instruction rs2 asInteger.
	self assert: 2r00100 equals: instruction rs1 asInteger.
	self assert: 2r00010 equals: instruction rd asInteger.