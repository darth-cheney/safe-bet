as yet unclassified
asByteArray
	"Respond with the integer value of this instruction as an array of bytes.
	NOTE: We may need to heavily customize this method in the future, given
	the endianness of Squeak and the little-endianness required of RISCV"
	| integer numBytes byteStream currentByte byteIndex |
	integer := self asInteger.
	numBytes := self lenx / 8.
	byteStream := WriteStream on: ByteArray new.
	currentByte := 0.
	byteIndex := 1.
	1 to: self lenx do: [ :bitIndex |
		byteIndex := bitIndex \\ 8.
		byteIndex = 0
			ifTrue: [
				currentByte := currentByte bitAt: 8 put: (integer bitAt: bitIndex).
				byteStream nextPut: currentByte.
				currentByte = 0 ]
			ifFalse: [
				currentByte := currentByte bitAt: byteIndex put: (integer bitAt: bitIndex).
			] ].
	^ byteStream contents