as yet unclassified
testImmediateValue
	"Ensure that we can construct an immediate value
	correctly based on a collection of potentially out-of-order
	RVImmediateParts.
	RISCV Instructions commonly split the immediate into parts
	across the instruction, and often not in linear order"
	| part1 part2 part3 otherPart inst |
	inst := RVInstruction new.
		
	"Diagram of parts, instruction order:
		[part1][part3][otherPart][part2] (this is the beginning)
		[       0][0011][xxxxxxxx][   101]"
	
	"2r101"
	part2 := RVImmediatePart new
		size: 3;
		partName: 'part1';
		immediateStartIndex: 2;
		setTo: 2r101.
	
	"n/a part, should be ignored"
	otherPart := RVInstructionPart new
		size: 20;
		partName: 'otherPart';
		setTo: 2r11111111111111111111.
	
	"2r0011"
	part3 := RVImmediatePart new
		size: 4;
		partName: 'part2';
		immediateStartIndex: 5;
		setTo: 2r0011.
	
	"2r0"
	part1 := RVImmediatePart new
		size: 1;
		partName: 'part1';
		setTo: 2r0.
		
	inst addPart: part2.
	inst addPart: otherPart.
	inst addPart: part3.
	inst addPart: part1.
	
	"We expect this to be the immediate value:
		2r00111010 (58)"
	self assert: 2r00111010 equals: inst immediateValue.

		
	 