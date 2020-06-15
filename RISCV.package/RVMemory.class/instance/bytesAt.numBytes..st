as yet unclassified
bytesAt: startIndex numBytes: numBytes
	"Respond with a ByteArray of values starting at the given index
	whose size will be the numBytes.
	We signal an error of the length of the desired ByteArray would
	attempt an access beyond the bounds of this memory"
	| bounds resultStream |
	bounds := startIndex + numBytes.
	(bounds > (size - 1))
		ifTrue: [ Error signal: 'Cannot access outside of Memory bounds!'].
	resultStream := WriteStream on: ByteArray new.
	startIndex to: bounds do: [ :currentIndex |
		resultStream nextPut: (self byteAt: currentIndex)].
	^ resultStream contents
	