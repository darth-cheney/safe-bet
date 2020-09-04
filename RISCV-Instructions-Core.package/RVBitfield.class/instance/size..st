as yet unclassified
size: anInteger
	"Sets a new size for the bitfield and the underlying
	bits Array.
	If the size is greater than the current size, we extend
	with 0s in the new bits. If it is less, we truncate from the
	high bits on down."
	| newBits |
	newBits := Array new: anInteger.
	(self size <= anInteger)
		ifTrue: [
			1 to: anInteger do: [ :bitIndex | 
				bitIndex <= self size
					ifTrue: [ newBits at: bitIndex put: (bits at: bitIndex) ]
					ifFalse: [ newBits at: bitIndex put: 0 ]].
			bits := newBits.
			^ self ].
		
	"Otherwise we truncate the existing bits"
	1 to: anInteger do: [ :bitIndex | newBits at: bitIndex put: (bits at: bitIndex)].
	bits := newBits