as yet unclassified
bytesAt: anIndex put: aByteArray
	"Attempt to store each byte in the incoming byte array
	starting at the 0-indexed address in the current memory.
	We signal an error if the bounds of this byte array would
	attempt to store beyond the bounds of the current memory."
	| bounds currentIndex |
	bounds := anIndex + aByteArray size.
	(bounds > (size - 1))
		ifTrue: [ Error signal: 'Cannot store outside the bounds of this Memory!'].
	currentIndex := anIndex.
	aByteArray do: [ :each |
		self byteAt: currentIndex put: each.
		currentIndex := currentIndex + 1 ]