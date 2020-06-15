as yet unclassified
initializeParts
	"Initialize the parts common to all SYSTEM calls.
	At this point, only EBREAK and ECALL are implemented, therefore
	those subclasses should override any part values that they need 
	separately. Much of the default values are common to both, so we
	set them here."
	opcode := RVInstructionPart new
		partName: 'opcode';
		size: 7;
		setTo: 2r1110011;
		isWriteable: false.
	self addPart: opcode.
	
	rd := RVInstructionPart new
		partName: 'rd';
		size: 5;
		setTo: 2r00000;
		isWriteable: false.
	self addPart: rd.
	
	funct3 := RVInstructionPart new
		partName: 'funct3';
		size: 3;
		setTo: 2r000;
		isWriteable: false.
	self addPart: funct3.
	
	rs1 := RVInstructionPart new
		partName: 'rs1';
		size: 5;
		setTo: 2r00000;
		isWriteable: false.
	self addPart: rs1.
	
	"This value is what distinguishes ECALL from EBREAK
	(and perhaps future others). Therefore we call on a class level
	accessor to get the appropriate value"
	funct12 := RVInstructionPart new
		partName: 'funct12';
		size: 12;
		setTo: self class funct12Value;
		isWriteable: false.
	self addPart: funct12.