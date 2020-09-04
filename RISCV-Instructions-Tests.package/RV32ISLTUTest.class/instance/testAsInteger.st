as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32ISLTU new.
	instruction rd setTo: 2r00001. "1"
	instruction rs1 setTo: 2r11001. "25"
	instruction rs2 setTo: 2r10001. "17" 
	
	"We expect an integer with the following structure:
		2r[0000000][10001][11001][011][00001][0110011]
		   [funct7    ][rs2     ][rs1     ][fn3 ][rd       ][opcode  ]"
	expected := 2r00000001000111001011000010110011.
	self assert: expected equals: instruction asInteger.