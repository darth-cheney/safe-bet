as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct LB instruction as an integer, will correctly
	give us an instance of RV32IILB."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[111110101110][00001][000][00100][0000011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r11111010111000001000001000000011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IILB equals: instruction class.
	self assert: 2r111110101110 equals: instruction imm1 asInteger.
	self assert: 2r11111111111111111111111110101110 equals: instruction unsignedImmediateValue.
	self assert: 2r00001 equals: instruction rs1 asInteger.
	self assert: 2r00100 equals: instruction rd asInteger.