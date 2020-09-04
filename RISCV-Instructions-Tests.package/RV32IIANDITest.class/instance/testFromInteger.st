as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct OR instruction as an integer, will correctly
	give us an instance of RV32IIANDI."
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[000001011101][00111][111][00011][0010011]
		   [imm1                ][rs1     ][fn3 ][rd       ][opcode   ]"
	incoming := 2r00000101110100111111000110010011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32IIANDI equals: instruction class.
