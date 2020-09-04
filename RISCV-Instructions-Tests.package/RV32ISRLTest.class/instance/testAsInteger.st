as yet unclassified
testAsInteger
	"Ensure that we get a correct Integer based on settings"
	| instruction |
	instruction := RV32ISRL new.
	instruction rd setTo: 2r101. "5"
	instruction rs1 setTo: 2r011. "3"
	instruction rs2 setTo: 2r1100. "12"
	
	"We expect:
	  	2r00000000110000011101001010110011 (12702387)
		[0000000][01100][00011][101][00101][0110011]
	    [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
		
	self assert: 2r00000000110000011101001010110011 equals: instruction asInteger.