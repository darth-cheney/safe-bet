as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with an instance of the correc RV32II subclass
	depending on the configuration of imm2 and funct3 in
	the incoming instruction (which is an Integer)."
	| funct3 toggleBit found fn3Match toggleBitMatch isJump isNoOp |
	
	"funct3 begins at 13, so we need to shift right by 12,
	since we are working with 0-indexed here"
	funct3 := 2r111 bitAnd: (anInteger >> 12).
	
	"The toggle bit is located in the second to last
	bit of the final immediate part (imm2)."
	toggleBit := 2r01 bitAnd: (anInteger >> 30).
	
	"Some jump instructions like JAL are I-types, but with
	a different opcode. This means they might have the same
	funct3 as other I-types. So we need to check the final bit
	of the opcode (which is different from other I-types)"
	isJump := (anInteger bitAt: 7) = 1.
	
	"A No-Op is a non-jump I-type opcode instruction
	whose other values are all set to 0 (an ADDI with all set to 0).
	We use a bitmask to determine if this is the case."
	isNoOp := (isJump not) and: [ (4294967168 bitAnd: anInteger) = 0 ].
	isNoOp
		ifTrue: [ ^ RV32INOP new ].
	
	isJump ifTrue: [
		found := (self subclasses select: [ :cls | cls isSpecialJump ]) detect: [ :cls | 
			fn3Match := (cls funct3 = funct3).
			fn3Match ]
		ifNone: [ Error signal: 'Invalid funct3 for Jump specialized I-type instruction RV32II '] ]
	ifFalse: [
		found := self subclasses
		detect: [ :subclass |
			fn3Match := (subclass funct3 = funct3).
			subclass isSpecialized
				ifTrue: [ toggleBitMatch := (toggleBit = subclass toggleBit) ]
				ifFalse: [ toggleBitMatch := true ].
			fn3Match and: [ toggleBitMatch ] ]
		ifNone: [ Error signal: 'Invalid funct3 or toggleBit values for RV32II type instruction' ] ].
	
	^ (found new
			setFromInteger: anInteger;
			yourself )	
	