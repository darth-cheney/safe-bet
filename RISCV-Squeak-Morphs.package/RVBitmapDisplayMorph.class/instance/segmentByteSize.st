as yet unclassified
segmentByteSize
	"Respond with an integer representing the memory segment
	size in bytes of the segment this bitmap display expects"
	^ (self image width * self image height) / 8