accessing
byteSize
	"Respond with the number of bytes that would
	be needed to represent this bitfield.
	For example, if the bitfield is size 14, we know
	we will need two full bytes (16) to represent it"
	(self size \\ 8) = 0
		ifTrue: [ ^ self size / 8 ]
		ifFalse: [ ^ (self size / 8) + 1 ]