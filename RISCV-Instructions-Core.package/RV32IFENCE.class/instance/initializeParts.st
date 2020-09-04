as yet unclassified
initializeParts
	opcode := RVInstructionPart new
		partName: 'opcode';
		size: 7;
		setTo: 2r0001111;
		isWriteable: false.
	self addPart: opcode.
	
	rd := RVInstructionPart new
		partName: 'rd';
		size: 5.
	self addPart: rd.
	
	funct3 := RVInstructionPart new
		partName: 'funct3';
		size: 3;
		setTo: 2r000; "This is the static value for FENCE"
		isWriteable: false.
	self addPart: funct3.
	
	rs1 := RVInstructionPart new
		partName: 'rs1';
		size: 5.
	self addPart: rs1.
	
	successor := RVInstructionPart new
		partName: 'successor';
		size: 4.
	self addPart: successor.
	
	predecessor := RVInstructionPart new
		partName: 'predecessor';
		size: 4.
	self addPart: predecessor.
	
	fm := RVInstructionPart new
		partName: 'fm';
		size: 4.
	self addPart: fm.