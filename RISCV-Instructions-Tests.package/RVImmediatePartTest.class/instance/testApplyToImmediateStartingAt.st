as yet unclassified
testApplyToImmediateStartingAt
	"Ensure that we can apply the bits of an immediate
	part to an Integer that represents the whole immediate.
	This is based on the #immediateStartIndex value that is set"
	| part target ex1 |
	part := RVImmediatePart new
		size: 4;
		immediateStartIndex: 3;
		setTo: 2r1101.
	target := 2r11000000.
	
	"Expect a result of
		2r11[1101]00"
	ex1 := part applyToImmediate: target startingAt: 3.
	self assert: 2r11110100 equals: ex1.

	"Expect a result of
		2r[1101]0000"
	ex2 := part applyToImmediate: target startingAt: 5.
	self assert: 2r11010000 equals: ex2.
	