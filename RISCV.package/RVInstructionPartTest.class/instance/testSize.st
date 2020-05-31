as yet unclassified
testSize
	"Tests that the correct size is set, but also that
	an appropriate bitmask is also set"
	| part |
	part := RVInstructionPart new
		size: 4;
		partName: 'testpart'.
		
	self assert: part size equals: 4.
	
	"The bitmask in this case should be 1111 or 2r1111"
	self assert: part privBitmask equals: 2r1111.
	