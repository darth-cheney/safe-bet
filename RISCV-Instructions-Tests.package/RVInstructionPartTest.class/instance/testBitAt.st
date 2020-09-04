as yet unclassified
testBitAt
	"Test accessing specific bits of the part"
	| part |
	part := RVInstructionPart new
		size: 5;
		partName: 'testpart';
		setTo: 2r00011011.
	
	self assert: (part bitAt: 1) equals: 1.
	self assert: (part bitAt: 2) equals: 1.
	self assert: (part bitAt: 3) equals: 0.
	self assert: (part bitAt: 4) equals: 1.
	self assert: (part bitAt: 5) equals: 1.
	