as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SLTIU instruction as an integer, will correctly
	give us an instance of RV32IISLTIU."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[011101100001][10001][011][00011][0010011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r01110110000110001011000110010011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IISLTIU equals: instruction class.
	self assert: 2r011101100001 equals: instruction immediateValue.
	self assert: 2r10001 equals: instruction rs1 asInteger.
	self assert: 2r00011 equals: instruction rd asInteger.