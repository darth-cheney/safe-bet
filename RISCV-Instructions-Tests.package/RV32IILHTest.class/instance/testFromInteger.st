as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct LH instruction as an integer, will correctly
	give us an instance of RV32IILH."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[000000000010][01010][001][00010][0000011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode ]"
	incoming := 2r00000000001001010001000100000011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IILH equals: instruction class.
	self assert: 2r000000000010 equals: instruction imm1 asInteger.
	self assert: 2r000000000010 equals: instruction immediateValue.
	self assert: 2r01010 equals: instruction rs1 asInteger.
	self assert: 2r00010 equals: instruction rd asInteger.