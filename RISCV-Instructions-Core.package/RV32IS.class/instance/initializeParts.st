as yet unclassified
initializeParts
	"Initialize the standard parts for an RV32I S-Type Instruction"
	opcode := RVInstructionPart new
		size: 7;
		partName: 'opcode';
		setTo: 2r0100011; "Same for all S-Types"
		isWriteable: false.
	self addPart: opcode.
	
	"This immediate part represents the first 5 bits
	of the overall immediate value. So we do not set
	any relative positioning for it (starts at 1 by default)"
	imm1 := RVImmediatePart new
		size: 5;
		partName: 'imm1'.
	self addPart: imm1.
	
	funct3 := RVInstructionPart new
		size: 3;
		partName: 'funct3'.
	self addPart: funct3.
	
	rs1 := RVInstructionPart new
		size: 5;
		partName: 'rs1'.
	self addPart: rs1.
	
	rs2 := RVInstructionPart new
		size: 5;
		partName: 'rs2'.
	self addPart: rs2.
	
	"This immediate part represents the
	upper 7 bits of the 12-bit immediate value.
	We therefore need to start it at 6."
	imm2 := RVImmediatePart new
		size: 7;
		partName: 'imm2';
		immediateStartIndex: 6.
	self addPart: imm2.
		