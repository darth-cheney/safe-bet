as yet unclassified
immediateBitLength
	"Respond with the size of this instruction's
	immediate value in bits"
	self hasImmediate ifFalse: [ ^ 0 ].
	^ self immediates inject: 0 into: [ :result :immediate | immediate size ]
