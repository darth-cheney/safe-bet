as yet unclassified
executeOn: aCPU
	"Execute this instruction on the given CPU"
	| source destination bitField bitStream address |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	address := (source value) + self immediateValue.
	bytes := aCPU memory bytesAt: address numBytes: 2.
	
	bitField := RVBitfield new size: (aCPU xlen).
	bitStream := bitField writeStream.
	bytes do: [ :byteValue |
		1 to: 8 do: [ :bitIndex | bitStream nextPut: (byteValue bitAt: bitIndex)]].
	
	"Because this instruction does NOT sign-extend the halfword
	value, and bitField already initializes with 0s for the rest of the
	bits, we simply put in the destination."
	destination value: bitField asUnsignedInteger.
	aCPU incrementPCBy: 4