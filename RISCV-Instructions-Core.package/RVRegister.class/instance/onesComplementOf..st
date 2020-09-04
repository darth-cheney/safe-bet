as yet unclassified
onesComplementOf: anInteger
	"Respond with all the bits of the given integer flipped"
	| result |
	result := 0.
	1 to: self width do: [:bitIndex |
		| foundBit |
		foundBit := anInteger bitAt: bitIndex.
		foundBit = 1
			ifTrue: [ result := result bitAt: bitIndex put: 0 ]
			ifFalse: [ result := result bitAt: bitIndex put: 1] ].
	^ result.