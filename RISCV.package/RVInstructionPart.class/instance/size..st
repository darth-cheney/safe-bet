as yet unclassified
size: anInteger
	"Sets the number of bits that the instruction
	part will be. Note that we also set the bitmask
	here"
	| bitStream |
	size := anInteger.
	bitStream := WriteStream on: String new.
	1 to: size do: [ :num |
		bitStream nextPut: $1 ].
	bitmask := Number readFrom: bitStream contents base: 2.