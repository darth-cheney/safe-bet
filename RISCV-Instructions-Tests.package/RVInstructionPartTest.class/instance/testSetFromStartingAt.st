as yet unclassified
testSetFromStartingAt
	"Test the setting of a parts bits based on
	an incoming integer starting at some index of
	bits on that integer"
	| part incoming |
	part := RVInstructionPart new
		size: 3;
		setTo: 2r101; "Initial value"
		partName: 'testpart'.
	incoming := 2r111010111111111.
	
	"We expect the value to be set from the
		incoming integer's 5 index, like so:
		2r11101011[111]1111"
	part setFrom: incoming startingAt: 5.
	self assert: 2r111 equals: part asInteger.