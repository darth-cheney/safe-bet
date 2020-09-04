as yet unclassified
testSetImmediateValue
	"Ensure that setting the immediate value does what we think
	it should. Here it should only set the lower 12 bits of imm1"
	| instruction |
	instruction := RV32IIANDI new.
	instruction immediateValue: 2r000001101101. "109"
	
	self assert: 2r000001101101 equals: instruction imm1 asInteger.
	self assert: 2r000001101101 equals: instruction immediateValue.