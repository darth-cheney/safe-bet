as yet unclassified
twosComplement
	"Respond with the two's complement of my bits"
	| onesComp result |
	onesComp := self onesComplement + 1.
	result := 0.
	1 to: self size do: [ :bitIndex | 
		result := result bitAt: bitIndex put: (onesComp bitAt: bitIndex)].
	^ result