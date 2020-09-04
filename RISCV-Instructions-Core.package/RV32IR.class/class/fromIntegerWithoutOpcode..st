as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with an instance of the correct RV32IR subclass
	depending on the configuration of func3 and func7 in the
	incoming instruction (which is an Integer).
	Note that we skip opcode checking here, and assume that
	it is the correct opcode for RV32IR instructions.
	This method will usually be called by RVInstriction class >> #fromInteger:
	which checks for the opcode and delegates here if appropriate"
	| funct3 funct7 found |
	
	"funct7 begins at 26, so we need to shift right by 25 (0-indexed)"
	funct7 := 2r1111111 bitAnd: (anInteger >> 25).
	
	"funct3 begins at 13, so we need to shift right by 12 (0-indexed)"
	funct3 := 2r111 bitAnd: (anInteger >> 12).
	found := self subclasses
		detect: [ :subClass |
			subClass funct7 = funct7 and: [ subClass funct3 = funct3 ] ]
		ifNone: [ Error signal: 'Invalid funct3 or funct7 values for RVI32R type instruction' ].
	^ (found new 
			setFromInteger: anInteger;
			yourself )