as yet unclassified
testApplyToStartingAt
	"Test the application of this part's bits onto some incoming
	Integer, beginning at the specified bit index of that Integer."
	| part ex1 ex2 |
	part := RVInstructionPart new
		size: 5;
		partName: 'testpart';
		setTo: 2r01101.
		
	"First case:
		(index: 4)
		(from)	2r[00000]000
		(to)		2r[01101]000"
	ex1 := part applyTo: 2r00000000 startingAt: 4.
	self assert: 2r01101000 equals: ex1.
	
	"Second case:
		(index: 3)
		(from)	2r1[11111]11
		(to)		2r1[01101]11"
	ex2 := part applyTo: 2r11111111 startingAt: 3.
	self assert: 2r10110111 equals: ex2.
	
	"Third case (to right edge)
		(index: 1)
		(from)	2r101[01010]
		(to)		2r101[01101]"
	ex3 := part applyTo: 2r10101010 startingAt: 1.
	self assert: 2r10101101 equals: ex3.