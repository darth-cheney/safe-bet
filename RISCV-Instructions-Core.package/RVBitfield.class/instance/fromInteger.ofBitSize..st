as yet unclassified
fromInteger: anInteger ofBitSize: aBitSize
	"Set the bits of this field from the incoming Integer value.
	Note that we treat the incoming integer bits as unsigned
	regardless of their initial Squeak representation.
	Sending #asSignedInteger should result in the original
	value if you pass in a negative integer."
	self size: aBitSize.
	1 to: aBitSize do: [:bitIndex | self bitAt: bitIndex put: (anInteger bitAt: bitIndex)]
	
	