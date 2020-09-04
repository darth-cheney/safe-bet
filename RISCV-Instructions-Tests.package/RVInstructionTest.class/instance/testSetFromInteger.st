as yet unclassified
testSetFromInteger
	"Ensure that we can set an Instruction's constituent parts
	from some incoming integer. We also check that any
	parts marked as non-writeable dont get written over
	by the incoming bits."
	| incoming instruction firstPart secondPart thirdPart |
	firstPart := RVInstructionPart new
		partName: 'first';
		size: 10;
		setTo: 2r1111111111.
	secondPart := RVInstructionPart new
		size: 10;
		partName: 'second';
		setTo: 2r1010101010;
		isWriteable: false. "Value cannot be overwritten now"
	thirdPart := RVInstructionPart new
		size: 12;
		partName: 'third';
		setTo: 2r000000000000.
	instruction := RVInstruction new.
	instruction addPart: firstPart.
	instruction addPart: secondPart.
	instruction addPart: thirdPart.
	
	incoming := 2r11111111111100000000001111111111.
	
	"We expect firstPart and secondPart to be set, but not
	thirdPart. It should produce an overall int of:
		2r[111111111111][1010101010][1111111111]
		   [ thirdPart          ][ secondPart ][ firstPart       ]
	secondPart should not change at all!"
	instruction setFromInteger: incoming.
	self assert: 2r111111111111 equals: thirdPart asInteger.
	self assert: 2r1010101010 equals: secondPart asInteger.
	self assert: 2r1111111111 equals: firstPart asInteger.
	self assert: 2r11111111111110101010101111111111 equals: instruction asInteger.