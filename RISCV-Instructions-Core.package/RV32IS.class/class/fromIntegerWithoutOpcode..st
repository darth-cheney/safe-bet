as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with and instance of the correct RV32IS
	subclass depending on the configuration of the funct3
	value in the incoming instruction (which is an Integer).
	Note that we skip opcode checking here, and assume
	that it is the correct opcode for the RV32IS instructions.
	This method will usually be called by RVInstruction class >> #fromInteger:
	which checks for the opcode and delegates here if appropriate"
	| funct3 found |
	
	"funct3 begins at 13, so we need to shift right by 12 (0-indexed)"
	funct3 := 2r111 bitAnd: (anInteger >> 12).
	
	found := self subclasses
		detect:[ :subclass |
			subclass funct3 = funct3 ]
		ifNone: [ Error signal: 'Invalid funct3 value for RV32IS type instruction' ].
		
	^ (found new
			setFromInteger: anInteger;
			yourself )