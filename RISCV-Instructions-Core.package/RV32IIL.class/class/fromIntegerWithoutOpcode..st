as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with an instrance of the correct RV32IIL subclass
	depending on the configuration of its funct3 value in the
	incoming instruction (which is an Integer).
	We skip the opcode checking and assume that the incoming
	instruction has the correct opcode for RV32IIL instructions already."
	| funct3 found |
	
	"funct3 begins at 13, so we need to shift right by 12,
	since we are working with 0-indexed here"
	funct3 := 2r111 bitAnd: (anInteger >> 12).
	
	found := self subclasses
		detect: [ :subclass |
			subclass funct3 = funct3 ]
		ifNone: [ Error signal: 'Invalid funct3 value for RV32IIL type instruction' ].
	^ (found new
			setFromInteger: anInteger;
			yourself )