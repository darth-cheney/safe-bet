tests
testFromInteger
	"Ensure that RVInstruction class >> #fromInteger:, when
	given a correct LD instruction as an integer, will correctly
	give us an instance of RV64IILD"
	| instruction incoming |
	
	"The structure of the incoming integer is:
		2r[100110010110][10000][011][00010][0000011]
		  [imm1        ][rs1  ][fn3][rd   ][opcode ]"
		
	incoming := 2r10011001011010000011000100000011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV64IILD equals: instruction class.
	self assert: 2r100110010110 equals: instruction imm1 asInteger.
	self assert: 2r10000 equals: instruction rs1 asInteger.
	self assert: 2r00010 equals: instruction rd asInteger