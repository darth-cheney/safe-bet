as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct LBU instruction as an integer, will correctly
	give us an instance of RV32IILBU."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[000010011110][11111][100][00100][0000011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r00001001111011111100001000000011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IILBU equals: instruction class.
	self assert: 2r000010011110 equals: instruction imm1 asInteger.
	self assert: 2r000010011110 equals: instruction immediateValue.
	self assert: 2r11111 equals: instruction rs1 asInteger.
	self assert: 2r00100 equals: instruction rd asInteger.