as yet unclassified
testBitAtPut
	"Test the setting of bits within the part"
	| part |
	part := RVInstructionPart new
		size: 3;
		partName: 'testpart';
		setTo: 2r101.
		
	"Set the first bit to 0"
	part bitAt: 1 put: 0.
	self assert: 2r100 equals: part asInteger.
	
	"Set the second bit to 1"
	part bitAt: 2 put: 1.
	self assert: 2r110 equals: part asInteger.
	
	"Set the third bit to 0"
	part bitAt: 3 put: 0.
	self assert: 2r010 equals: part asInteger.
	