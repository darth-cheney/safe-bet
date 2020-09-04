as yet unclassified
concatWith: aBitfield
	"Respond with a new bitfield that is the concatenation of
	my bits followed by the incoming bitfield's bits."
	| writeStream result myStream theirStream |
	result := RVBitfield new size: (self size + aBitfield size).
	writeStream := result writeStream.
	myStream := self readStream.
	theirStream := aBitfield readStream.
	writeStream nextPutAll: myStream contents.
	writeStream nextPutAll: theirStream contents.
	^ result

	