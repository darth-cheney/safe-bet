as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with an instance of the correc RV32II subclass
	depending on the configuration of imm2 and funct3 in
	the incoming instruction (which is an Integer).
	We skip opcode checking and assume that the incoming
	instruction has the correct opcode for RVI32I already."
	| funct3 toggleBit found fn3Match toggleBitMatch |
	
	"funct3 begins at 13, so we need to shift right by 12,
	since we are working with 0-indexed here"
	funct3 := 2r111 bitAnd: (anInteger >> 12).
	
	"The toggle bit is located in the second to last
	bit of the final immediate part (imm2)."
	toggleBit := 2r01 bitAnd: (anInteger >> 30).
	
	found := self subclasses
		detect: [ :subclass |
			fn3Match := (subclass funct3 = funct3).
			subclass isSpecialized
				ifTrue: [ toggleBitMatch := (toggleBit = subclass toggleBit) ]
				ifFalse: [ toggleBitMatch := true ].
			fn3Match and: [ toggleBitMatch ] ]
		ifNone: [ Error signal: 'Invalid funct3 or toggleBit values for RV32II type instruction' ].
	^ (found new
			setFromInteger: anInteger;
			yourself )	
	