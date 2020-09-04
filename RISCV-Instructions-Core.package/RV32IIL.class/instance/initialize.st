as yet unclassified
initialize
	super initialize.
	
	"Update with the correct opcode to I-type Load instructions"
	opcode
		isWriteable: true;
		setTo: 2r0000011;
		isWriteable: false.