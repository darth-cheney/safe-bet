as yet unclassified
initialize
	super initialize.
	
	"U-types can have several different opcodes"
	opcode
		isWriteable: true;
		setTo: 2r0010111;
		isWriteable: false.
		