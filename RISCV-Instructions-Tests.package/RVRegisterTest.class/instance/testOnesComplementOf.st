as yet unclassified
testOnesComplementOf
	"Test the ability of Register objects to correctly compute
	the ones complement bits of a given Integer"
	| example1 example2 example3 register |
	register := RVRegister new. "Initializes an 8-bit register"
	example1 := 2r10110110.
	self assert: (register onesComplementOf: example1) equals: 2r01001001.
	
	"Test an overflow example (takes only first regiter length bits)"
	example2 := 2r101111011.
	self assert: (register onesComplementOf: example2) equals: 2r10000100.
	
	example3 := 2r111111111111.
	self assert: (register onesComplementOf: example3) equals: 2r0.
	
	