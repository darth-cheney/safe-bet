as yet unclassified
initializeParts
	"Initialize the standard parts for an RV32I R-Type instruction"
	opcode := RVInstructionPart new
		size: 7;
		partName: 'opcode';
		setTo: 2r0110011. "All R-Types have this opcode"
	self addPart: opcode.
	opcode isWriteable: false.
	
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
		
	rs2 := RVInstructionPart new
		size: 5;
		partName: 'rs2'.
	self addPart: rs2.
		
	funct7 := RVInstructionPart new
		size: 7;
		partName: 'funct7'.
	self addPart: funct7.
		
	