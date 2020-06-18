as yet unclassified
asSignedInteger
	"Respond with a Squeak integer that is representative
	of the twos complement signed value of the bits in this
	register"
	| negatedBits |
	
	"If the last bit is 0, this is not negative and we can
	return the unsigned value"
	bits last = 0 ifTrue: [ ^ self asUnsignedInteger ].
	
	negatedBits := bits reversed collect: [ :bit |
		bit = 1 
			ifTrue: [ 0 ]
			ifFalse: [ 1 ]
	].

	^ (negatedBits
			inject: 0
			into: [ :accumulated :bit | 
				(bit = 1)
					ifTrue: [ accumulated << 1 + 1]
					ifFalse: [ accumulated << 1] ]) negated - 1
	
	