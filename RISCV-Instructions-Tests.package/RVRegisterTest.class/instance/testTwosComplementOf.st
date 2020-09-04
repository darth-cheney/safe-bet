as yet unclassified
testTwosComplementOf
	"Ensure that we can accurately convert to the two's complement
	of the given integer (whose resulting size will be the register size)"
	| example1 example2 register |
	register := RVRegister new. "Initializes an 8 bit register"
	
	example1 := 2r00000101. "5"
	self assert: (register twosComplementOf: example1) equals: 2r11111011.
	
	"Now flip it back to the original value"
	example2 := 2r11111011. "-5 in twos complement"
	self assert: (register twosComplementOf: example2) equals: example1.