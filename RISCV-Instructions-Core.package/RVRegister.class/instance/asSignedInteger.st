as yet unclassified
asSignedInteger
	"Respond with a Squeak integer that is representative
	of the two's complement signed value of the bits in this
	register."
	| isNegative |
	isNegative := bits last = 1.
	isNegative
	ifTrue: [
		^ ((bits reversed collect:[ :fBit | self negateBit: fBit ])
			inject: 0
			into: [ :accumulated :bit |
				(bit = 1) 
					ifTrue: [ accumulated << 1 + 1 ]
					ifFalse: [ accumulated << 1] ]) negated - 1 ].

	"Otherwise, we return as if it's an unsigned integer"
	^ self asUnsignedInteger
			