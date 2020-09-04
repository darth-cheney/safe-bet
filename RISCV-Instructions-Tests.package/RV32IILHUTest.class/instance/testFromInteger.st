as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct LHU instruction as an integer, will correctly
	give us an instance of RV32IILHU."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[110100011011][00001][101][10000][0000011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r111010001101100001101100000000011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IILHU equals: instruction class.
	self assert: 2r110100011011 equals: instruction imm1 asInteger.
	self assert: 2r11111111111111111111110100011011 equals: instruction unsignedImmediateValue. "Sign extended to 32-bits"
	self assert: 2r00001 equals: instruction rs1 asInteger.
	self assert: 2r10000 equals: instruction rd asInteger.