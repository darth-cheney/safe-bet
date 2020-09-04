as yet unclassified
asUnsignedInteger
	| result |
	result := 0.
	bits doWithIndex: [ :bitVal :bitIndex | result := result bitAt: bitIndex put: bitVal ].
	^ result