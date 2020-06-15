as yet unclassified
byteAt: anIndex
	"Respond with the byte value at the given 0-indexed index.
	If the index is greater than the size-1 of this memory, signal
	an error"
	(anIndex > (size - 1))
		ifTrue: [ Error signal: 'Memory access out of bounds!' ].
	^ mapping at: anIndex ifAbsent: [ 0 ].