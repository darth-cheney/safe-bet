as yet unclassified
testAddPart
	"Test the adding of parts to the instruction.
	We are concerned that parts are added in order and
	have the correct indices set on themselves as they
	are added"
	| part1 part2 part3 inst |
	inst := RVInstruction new.
	part1 := RVInstructionPart new
		size: 11;
		partName: 'first';
		setTo: 2r11111111111.
	part2 := RVInstructionPart new
		size: 6;
		partName: 'second';
		setTo: 2r000000.
	part3 := RVInstructionPart new
		size: 5;
		partName: 'third';
		setTo: 2r11111.
	
	"Ensure the first part has the correct index values"
	inst addPart: part1.
	self assert: 1 equals: part1 startIndex.
	self assert: 11 equals: part1 endIndex.
	
	"Ensure that the second part has the correct index values"
	inst addPart: part2.
	self assert: 12 equals: part2 startIndex.
	self assert: 17 equals: part2 endIndex.
	
	"Ensure that the third part has the correct index values"
	inst addPart: part3.
	self assert: 18 equals: part3 startIndex.
	self assert: 22 equals: part3 endIndex.
	