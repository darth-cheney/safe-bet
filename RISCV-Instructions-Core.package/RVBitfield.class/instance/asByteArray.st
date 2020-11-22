converting
asByteArray
	"Respond with a *little endian* byte array that is
	correctly padded to a byte-aligned (8bits) size of 
	the bitfield receiver"
	| reader |
	reader := self readStream.
	^ (1 to: self byteSize)
		collect: [ :byteIndex |
			| bf |
			bf := RVBitfield new size: 8.
			bf writeStream nextPutAll: (reader next: 8).
			bf asUnsignedInteger ]