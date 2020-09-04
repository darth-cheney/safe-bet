as yet unclassified
byteAt: anIndex put: aByte
	"Attempt to store the incoming aByte in the memory at the
	0-indexed address anIndex. Signal an error if the index is beyond
	the bounds of this memory"
	(anIndex > (size - 1))
		ifTrue: [ Error signal: 'Cannot store outside of bounds of Memory' ].
	mapping at: anIndex put: aByte.