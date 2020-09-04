as yet unclassified
testSize
	"Tests that the correct size is set"
	| part |
	part := RVInstructionPart new
		size: 4;
		partName: 'testpart'.
		
	self assert: part size equals: 4.
	