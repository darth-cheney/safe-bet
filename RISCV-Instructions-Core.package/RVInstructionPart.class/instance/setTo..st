as yet unclassified
setTo: anInteger
	"Sets the internal bits to those specified by
	the incoming integer. Note that we use the
	bitmask to set any bits beyond the size of
	this part to 0 first."
	self isWriteable ifTrue: [
		self fromInteger: anInteger ofBitSize: self size ].
