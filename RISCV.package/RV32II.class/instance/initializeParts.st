as yet unclassified
initializeParts
	"Initialize the standard parts for an RV32I I-Type instruction"
	opcode := RVInstructionPart new "0010011"
		size: 7;
		partName: 'opcode';
		setTo: 2r0010011; "Same for all I types"
		isWriteable: false.
	self addPart: opcode.
	
	rd := RVInstructionPart new
		size: 5;
		partName: 'rd'.
	self addPart: rd.
	
	funct3 := RVInstructionPart new
		size: 3;
		partName: 'funct3'.
	self addPart: funct3.
	
	rs1 := RVInstructionPart new
		size: 5;
		partName: 'rs1'.
	self addPart: rs1.
	
	imm1 := RVImmediatePart new
		size: 12;
		partName: 'imm1'.
	self addPart: imm1.
	
