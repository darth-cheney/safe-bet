as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SH instruction as an integer, will correctly
	give us an instance of RV32ISSH."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[1101001][00011][11100][001][11110][0100011]
		   [imm2     ][rs2     ][rs1     ][fn3 ][imm1 ][opcode  ]"
	incoming := 2r11010010001111100001111100100011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32ISSH equals: instruction class.
	self assert: 2r1101001 equals: instruction imm2 asInteger.
	self assert: 2r11110 equals: instruction imm1 asInteger.
	self assert: 2r00011 equals: instruction rs2 asInteger.
	self assert: 2r11100 equals: instruction rs1 asInteger.