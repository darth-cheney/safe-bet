as yet unclassified
bitAt: anIndex put: aValue
	"Set the bit at the relative index (meaning, outside of a
	startIndex context and purely in partValue bits) to the
	given value. aValue here should be either 1 or 0 in
	integer form"
	(anIndex > self size)
		ifTrue: [ Error signal: 'Provided bit index is greater than part size'].
	
	(aValue = 0 or: [ aValue = 1 ])
		ifTrue: [ partValue := partValue bitAt: anIndex put: aValue ].
	