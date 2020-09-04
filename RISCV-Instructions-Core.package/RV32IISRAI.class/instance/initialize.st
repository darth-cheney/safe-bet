as yet unclassified
initialize
	super initialize.
	
	"Because SRAI is a 'specialized' I-type,
	we shorten imm1 (and alias it as 'shamt')
	to 5, and create imm2, setting it to size 7."
	imm1 size: 5.
	imm2 := RVImmediatePart new
		size: 7;
		partName: 'imm2'.
	self addPart: imm2.
	
	"We also set the second-to-last bit
	of imm2 to 1 for SRAI instructions"
	imm2 bitAt: (imm2 size - 1) put: self class toggleBit.
	
	"We disable writing to imm2, since that only
	carries the toggleBit for my specialize I-type"
	imm2 isWriteable: false.
	
	"Set the funct3 for this instruction type"
	self funct3 setTo: self class funct3.