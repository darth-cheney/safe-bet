as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IBBLT new.
	instruction rs2 setTo: 2r10101.
	instruction rs1 setTo: 2r01010.
	instruction immediateValue: 2r1000000100010. "Note: first bit is ignored."
	
	"We expect the integer to be the following: 
		2r[1          ][000001][10101][01010][100][0001  ][0        ][1100011]
		   [imm4   ][imm3   ][rs2     ][rs1     ][fn3 ][imm2][imm1 ][opcode   ]
		   [13        ][6:11     ]                                  [2:5    ][12      ]"
	expected := 2r10000011010101010100000101100011.
	self assert: expected equals: instruction asInteger.