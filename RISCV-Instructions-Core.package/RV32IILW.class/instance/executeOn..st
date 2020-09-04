as yet unclassified
executeOn: aCPU
	"Execute this instruction on the given CPU instance"
	| source destination bitField bitStream address |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	address := (source value) + self immediateValue.
	
	bitField := RVBitfield new size: (aCPU xlen).
	bitStream := bitField writeStream.
	"Fetch a byte array of 4 bytes (32 bit word length) starting
	at the given memory address"
	(aCPU memory bytesAt: address numBytes: 4) do: [ :byteValue |
		1 to: 8 do: [ :bitIndex | bitStream nextPut: (byteValue bitAt: bitIndex )]].
	
	destination value: bitField asUnsignedInteger.
	aCPU incrementPCBy: 4