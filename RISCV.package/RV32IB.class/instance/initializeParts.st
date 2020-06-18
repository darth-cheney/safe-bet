as yet unclassified
initializeParts
	"Create the different instruction parts for
	RV32IB (branch) type instructions"
	
	opcode := RVInstructionPart new
		size: 7;
		setTo: 2r1100011;
		partName: 'opcode';
		isWriteable: false.
	self addPart: opcode.
		
	"imm1 represents the 0-indexed 11th bit of the immediate"
	imm1 := RVImmediatePart new
		partName: 'imm1';
		size: 1;
		immediateStartIndex: 12.
	self addPart: imm1.
	
	"imm2 represents 1:4 (0-indexed) bits of the immediate
	The RISC-V Spec indicates that the first bit is always set to 0.
	See my class's override of #immediateValue to see that in action"
	imm2 := RVImmediatePart new
		partName: 'imm2';
		size: 4;
		immediateStartIndex: 2.
	self addPart: imm2.
	
	"funct3 value"
	funct3 := RVInstructionPart new
		size: 3;
		partName: 'funct3'.
	self addPart: funct3.
	
	"rs1"
	rs1 := RVInstructionPart new
		size: 5;
		partName: 'rs1'.
	self addPart: rs1.
	
	"rs2"
	rs2 := RVInstructionPart new
		size: 5;
		partName: 'rs2'.
	self addPart: rs2.
	
	"imm3 represents 5:10 (0-indexed) bits of the immediate value"
	imm3 := RVImmediatePart new
		size: 6;
		partName: 'imm3';
		immediateStartIndex: 6.
	self addPart: imm3.
	
	"imm4 represents the 12th bit (0-indexed) of the immediate value.
	This is is the sign bit"
	imm4 := RVImmediatePart new
		size: 1;
		partName: 'imm4';
		immediateStartIndex: 13.
	self addPart: imm4.

		
	
		