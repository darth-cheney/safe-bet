as yet unclassified
onesComplement
	"Respond with an integer that equals all the bits of
	my unsigned integer representation flipped"
	| result |
	result := 0.
	bits withIndexDo: [ :bit :bitIndex |
		bit = 1 
			ifTrue: [ result := result bitAt: bitIndex put: 0]
		 	ifFalse: [ result := result bitAt: bitIndex put: 1]].
	^ result