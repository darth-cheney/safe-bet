as yet unclassified
signExtendTo: bitsize
	"Sign-extending a bitfield will first look at the most significant
	bit to determine the desired sign (in eventual twos complement)
	and then return a copy of itself extended to the given bitsize with
	all extra spots filled with the sign bit.
	For example:
		{ 1 0 1 1 1 1 0 1}
	Sign extended to 16 will return a new bitfield:
		{ 1 1 1 1 1 1 1 1 1 0 1 1 1 1 0 1}"
	| newBitfield |
	(self size < bitsize)
		ifTrue: [ ^ Error signal: 'Attempting to sign extend a bitfield to a smaller value '].
	
	newBitfield := RVBitfield new size: bitsize.
	1 to: self size do: [ :bitIndex | newBitfield bitAt: bitIndex put: (self bitAt: bitIndex)].
	(self size + 1) to: newBitfield size do: [ :bitIndex | newBitfield bitAt: bitIndex put: bits last ].
	^ newBitfield	