as yet unclassified
initializeParts
	
	opcode := RVInstructionPart new
		partName: 'opcode';
		size: 7;
		isWriteable: false.
	self addPart: opcode.
	
	rd := RVInstructionPart new
		partName: 'rd';
		size: 5.
	self addPart: rd.
		
	"imm1 represents the 0-indexed 12th to 31st bits of the immediate value"
	imm1 := RVImmediatePart new
		partName: 'imm1';	
		size: 20;
		immediateStartIndex: 13.
	self addPart: imm1.