as yet unclassified
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct SRL instruction as an integer, will correctly
	give us an instance of RV32ISRL."
	| instruction incoming |
	
	"The structure of the incoming is as follows:
		2r[0000000][00111][11000][101][00001][0110011]
		    [funt7     ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	incoming := 2r00000000011111000101000010110011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV32ISRL equals: instruction class.
	self assert: 2r00111 equals: instruction rs2 asInteger.
	self assert: 2r11000 equals: instruction rs1 asInteger.