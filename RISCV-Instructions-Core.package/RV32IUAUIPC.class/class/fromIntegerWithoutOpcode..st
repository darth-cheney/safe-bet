as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with a formatted instance of this instruction based on
	the incoming integer.
	Note that U-type instructions can have multiple opcodes, so
	a given opcode directly maps to the correct instance of the correct
	subclass of RV32IU"
	^ ( self new
			setFromInteger: anInteger;
			yourself )