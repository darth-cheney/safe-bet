as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct LW instruction as an integer, will correctly
	give us an instance of RV32IILW."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[111111110011][00011][010][00001][0000011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r11111111001100011010000010000011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IILW equals: instruction class.
	self assert: 2r111111110011 equals: instruction imm1 asInteger.
	self assert: 2r11111111111111111111111111110011 equals: instruction unsignedImmediateValue. "Sign-extended to 32bits"
	self assert: 2r00011 equals: instruction rs1 asInteger.
	self assert: 2r00001 equals: instruction rd asInteger.