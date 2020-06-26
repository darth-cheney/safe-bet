as yet unclassified
unsignedImmediateValue
	"Respond with the value of the immediate for
	this instruction, treating it as unsigned."
	| newBitField writeStream immSize |
	immSize := self immediates
		inject: 0
		into: [ :acc :imm | acc + imm size ].
	newBitField := RVBitfield new size: immSize.
	writeStream := newBitField writeStream.
	self sortedImmediates do: [ :immediate | writeStream nextPutAll: immediate readStream contents ].
	self hasTwoByteMultImmediate ifTrue: [ newBitField bitAt: 1 put: 0 ].
	^ newBitField asUnsignedInteger 