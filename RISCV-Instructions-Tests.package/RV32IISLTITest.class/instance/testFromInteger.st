as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SLTI instruction as an integer, will correctly
	give us an instance of RV32IISLTI."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[010111111111][11100][010][11011][0010011]
		   [imm1               ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r01011111111111100010110110010011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IISLTI equals: instruction class.
	self assert: 2r010111111111 equals: instruction immediateValue.
	self assert: 2r11100 equals: instruction rs1 asInteger.
	self assert: 2r11011 equals: instruction rd asInteger.