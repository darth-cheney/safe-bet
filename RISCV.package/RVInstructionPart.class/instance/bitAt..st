as yet unclassified
bitAt: anInteger
	"Return the bit at the given relative index location
	for this part's partValue.
	Returned values will be either the integer 1 or 0."
	| result |
	(anInteger > self size)
		ifTrue: [ Error signal: 'Bit index value is greater than part size' ].
		
	result := (1 bitShift: anInteger - 1) bitAnd: partValue.
	(result > 0)
		ifTrue: [ ^1 ].
	^ 0.