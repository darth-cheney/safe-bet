as yet unclassified
testSetFromStartingAtNonWriteable
	"Ensure that we don't set any bits at all of a part
	when calling #setFrom:startingAt: on a part that is
	currently non-writeable"
	| part incoming |
	part := RVInstructionPart new
		size: 4;
		partName: 'test-part';
		setTo: 2r1101; "Initial value, will be static"
		isWriteable: false.
	incoming := 2r000100001001000.
	
	"We expect the part value to remain 2r1101.
	We will attempt to write bits from the incoming
	integer starting at index 5:
		2r0001000[0100]1000
	But the value of the part *should not* be 2r0100"
	part setFrom: incoming startingAt: 5.
	self assert: 2r1101 equals: part asInteger.