as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct ADDI instruction as an integer, will correctly
	give us an instance of RV32IIADDI."
	| instruction incoming |
	
	"The structure of the incoming is as follows:
		2r[000011110000][00001][000][11111][0010011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r00001111000000001000111110010011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IIADDI equals: instruction class.
	self assert: 2r000011110000 equals: instruction immediateValue.
	self assert: 2r00001 equals: instruction rs1 asInteger.
	self assert: 2r11111 equals: instruction rd asInteger.