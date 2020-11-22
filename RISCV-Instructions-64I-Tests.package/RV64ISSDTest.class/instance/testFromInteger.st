tests
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SD instruction as an integer, will correctly
	give us an instance of RV64ISSD"
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[1111101][00010][10011][011][00001][0100011]
		  [imm2   ][rs2  ][rs1  ][fn3][imm1 ][opcode ]"
	incoming := 2r11111010001010011011000010100011.
	instruction := RVInstruction fromInteger: incoming.
	
	self assert: RV64ISSD equals: instruction class.
	self assert: 2r1111101 equals: instruction imm2 asInteger.
	self assert: 2r00010 equals: instruction rs2 asInteger.
	self assert: 2r10011 equals: instruction rs1 asInteger.
	self assert: 2r00001 equals: instruction imm1 asInteger.