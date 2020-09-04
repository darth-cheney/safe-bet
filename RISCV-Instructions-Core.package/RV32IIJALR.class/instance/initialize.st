as yet unclassified
initialize
	super initialize.
	self funct3 setTo: self class funct3.
	
	"Though an I-type, JALR has a different opcode:"
	opcode 
		isWriteable: true;
		setTo: 2r1100111;
		isWriteable: false.