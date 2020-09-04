as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SW instruction as an integer, will correctly
	give us an instance of RV32ISSW."
	| instruction incoming |
	
	"The structure of the incoming integer is: 
		2r[0010011][00001][00010][010][00101][0100011]
		   [imm2     ][rs2     ][rs1     ][fn3 ][imm1 ][opcode  ]"
	incoming := 2r00100110000100010010001010100011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32ISSW equals: instruction class.
	self assert: 2r0010011 equals: instruction imm2 asInteger.
	self assert: 2r00001 equals: instruction rs2 asInteger.
	self assert: 2r00010 equals: instruction rs1 asInteger.
	self assert: 2r00101 equals: instruction imm1 asInteger.
	self assert: 2r001001100101 equals: instruction immediateValue.