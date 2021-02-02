as yet unclassified
updateBits
	"Map the bits from the memory to the underlying form"
	| bytes  |
	memory ifNil: [ 
		self stopStepping.
		^ self ].
	bytes := memory bytesAt: self segmentStartAddress numBytes: self segmentByteSize.
	self image bits fromByteStream: bytes readStream.
	self changed.
	
	