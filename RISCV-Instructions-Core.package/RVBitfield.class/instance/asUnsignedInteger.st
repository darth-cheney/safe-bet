as yet unclassified
asUnsignedInteger
	"Respond with an unsigned integer representation of my bits.
	Note that the bits are reversed in a radix / binary representation"
	| value | 
	value := 0.
	bits withIndexDo: [ :bit :bitIndex | value := value bitAt: bitIndex put: bit ].
	^ value