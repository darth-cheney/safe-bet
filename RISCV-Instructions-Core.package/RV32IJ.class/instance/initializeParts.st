as yet unclassified
initializeParts
	"Initialize the default parts for a J-type instruction" 
	opcode := RVInstructionPart new
		partName: 'opcode';
		size: 7;
		setTo: 2r1101111; "Taken from the JAL instruction, the only J-type I know of so far"
		isWriteable: false.
	self addPart: opcode.
	
	rd := RVInstructionPart new
		partName: 'rd';
		size: 5.
	self addPart: rd.
	
	"imm1 represents the 0-indexed 12th bit of the immediate, to the 19th"
	imm1 := RVImmediatePart new
		partName: 'imm1';
		size: 8;
		immediateStartIndex: 13.
	self addPart: imm1.
	
	"imm2 represents the 0-indexed 11th bit of the immediate, by itself"
	imm2 := RVImmediatePart new
		partName: 'imm2';
		size: 1;
		immediateStartIndex: 12.
	self addPart: imm2.
	
	"imm3 represents the 0-indexed 1st (not 0th) bit to the 10th bit of the immediate"
	imm3 := RVImmediatePart new
		partName: 'imm3';
		size: 10;
		immediateStartIndex: 2.
	self addPart: imm3.
	
	"imm4 represents the 0-indexed 20th bit of the immediate value"
	imm4 := RVImmediatePart new
		partName: 'imm4';
		size: 1;
		immediateStartIndex: 21.
	self addPart: imm4.
		