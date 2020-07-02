as yet unclassified
unsignedImmediateValue
	| newBitField writeStream signBit immSize |
	newBitField := RVBitfield new size: 32.
	immSize := self immediates
		inject: 0
		into: [ :acc :imm | acc + imm size ].
	writeStream := newBitField writeStream.
	self sortedImmediates do: [ :imm | writeStream nextPutAll: imm readStream contents ].
	signBit := newBitField bitAt: immSize.
	(immSize + 1) to: 32 do: [ :bitIndex |
		newBitField bitAt: bitIndex put: signBit ].
	^ newBitField asUnsignedInteger