as yet unclassified
testSetImmediateValue
	"Test setting the immediate value via #immediateValue:.
	LUI expects a 20bit unsigned value for its single immediate value
	imm part"
	| instruction expected |
	instruction := RV32IULUI new.
	expected := 2r11110000111100001111000000000000.
	instruction immediateValue: expected.
	
	self assert: instruction immediateValue equals: expected
	