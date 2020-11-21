tests
testFromInteger
	"Ensure that RVInstruction class > #fromInteger:, when
	given a correct LWU instruction as an integer, will correctly
	give us an instance of RV64IILWU"
	|instruction incoming |
	
	"The structure of the incoming integer is:
		2r[011100010110][01000][110][10000][0000011]
		  [imm1        ][rs1  ][fn3][rd   ][opcode ]"
	incoming := 2r01110001011001000110100000000011.
	instruction := RVInstruction fromInteger: incoming.
	self assert: RV64IILWU equals: instruction class.
	self assert: 2r011100010110 equals: instruction imm1 asInteger.
	self assert: 2r01000 equals: instruction rs1 asInteger.
	self assert: 2r10000 equals: instruction rd asInteger