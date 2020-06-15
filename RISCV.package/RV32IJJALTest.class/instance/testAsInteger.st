as yet unclassified
testAsInteger
	"Ensure that we can accurately represent this
	instruction as an integer"
	| instruction expected |
	instruction := RV32IJJAL new.
	instruction rd setTo: 2r10111.
	instruction immediateValue: 2r111110101110111101011100110110001. "Only takes the lower 21 bits, dropping the first bit (2 aligned)"
	
	"We expect an integer with the following structure:
		2r[1       ][0011011000][1       ][11101011][10111][1101111]
		   [imm4][imm3           ][imm2][imm1       ][rd      ][opcode  ]
		   [20     ][10:1             ][11      ][19:12       ]                           | 0-indexed"
	expected := 2r10011011000111101011101111101111.
	self assert: expected equals: instruction asInteger.