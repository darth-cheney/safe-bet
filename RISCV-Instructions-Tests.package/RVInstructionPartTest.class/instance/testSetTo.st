as yet unclassified
testSetTo
	"Tests the setting of the bits of a part based
	on an incoming Integer. Note that we expect
	a mask of the size of the part to be applied
	to the incoming Integer, and for the resulting
	internal partValue (via asInteger) to contain only
	the relevant bits"
	| part |
	part := RVInstructionPart new
		size: 3;
		partName: 'testpart'.
	
	"In this first case, we expect: 
		2r10101011
	to become:
		2r00000011"
	part setTo: 2r10101011.
	self assert: part asInteger equals: 2r00000011.
	
	"In this second case we expect:
		2r11111000
	to become:
		2r00000000 (ie zero)"
	part setTo: 2r11111000.
	self assert: part asInteger equals: 0.
	