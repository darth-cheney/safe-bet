as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with an instance of the correct RV32IB subclass
	depending on the configuration of funct3 in the incoming
	instruction (which is an Integer).
	We skip opcode checking and assume that the incoming
	instruction has the correct opcode for RV32IB already.
	(See RVInstruction class >> #fromInteger: for more details)"
	| funct3 found |
	
	"funct3 begins at 13, so we shift right by 12, since we
	are working 0-indexed here"
	funct3 := 2r111 bitAnd: (anInteger >> 12).
	
	found := self subclasses
		detect: [ :subclass |
			subclass funct3 = funct3 ]
		ifNone: [ Error signal: 'Invalid funct3 value for RV32IB type instruction' ].
		
	^ (found new
			setFromInteger: anInteger;
			yourself )