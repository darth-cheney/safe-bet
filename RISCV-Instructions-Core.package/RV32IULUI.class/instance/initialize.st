as yet unclassified
initialize
	super initialize.
	
	"U-types have differing opcodes"
	opcode
		isWriteable: true;
		setTo: 2r0110111;
		isWriteable: false.