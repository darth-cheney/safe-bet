as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct JALR instruction as an integer, will correctly
	give us an instance of RV32IIJALR."
	| instruction incoming |
	
	"The structure of the incoming is as follows:
		2r[111011111011][10010][000][01101][1100111]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r11101111101110010000011011100111.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IIJALR equals: instruction class.
	self assert: 2r111011111011 equals: instruction imm1 asInteger.
	self assert: 2r11111111111111111111111011111011 equals: instruction immediateValue. "Sign extended to 32-bits"
	self assert: 2r10010 equals: instruction rs1 asInteger.
	self assert: 2r000 equals: instruction funct3 asInteger.
	self assert: 2r01101 equals: instruction rd asInteger.