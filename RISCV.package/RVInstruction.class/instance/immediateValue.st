as yet unclassified
immediateValue
	"Respond with the value of the immediate for this
	instruction.
	Senders should check #hasImmediate first, as
	instructions without immediates will respond with 0.
	We select and sort all immediate parts and then compute
	the actual bits, responding with the resulting Integer value."
	| newBitField writeStream immSize |
	immSize := self immediates
		inject: 0
		into: [ :acc :imm | acc + imm size ].
	newBitField := RVBitfield new size: immSize.
	writeStream := newBitField writeStream.
	self sortedImmediates do: [ :imm | writeStream nextPutAll: imm readStream contents ].
	self isSignedImmediate
		ifTrue: [ ^ newBitField asSignedInteger ].
	^ newBitField asUnsignedInteger