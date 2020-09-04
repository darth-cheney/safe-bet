as yet unclassified
twosComplementOf: anInteger
	"Respond with the two's complement of the given integer."
	| onesComp result |
	onesComp := self onesComplementOf: anInteger.
	onesComp := onesComp + 1.
	result := 0.
	1 to: self width do: [ :bitIndex |
		result := result bitAt: bitIndex put: (onesComp bitAt: bitIndex)].
	^ result 