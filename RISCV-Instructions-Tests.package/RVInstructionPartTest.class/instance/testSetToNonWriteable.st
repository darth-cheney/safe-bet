as yet unclassified
testSetToNonWriteable
	"Peform a #setTo: on a part that is marked as non-writeable.
	It should have no effect on the part"
	| part incoming |
	part := RVInstructionPart new
		size: 4;
		partName: 'testpart';
		setTo: 2r1010; "Initial value"
		startingAt: 3;
		isWriteable: false.
	incoming := 2r1111.
	
	"We expect the part to just remain 2r1010"
	part setTo: incoming.
	self assert: 2r1010 equals: part asInteger.
	