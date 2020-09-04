as yet unclassified
executeOn: aCPU
	"Execute this instruction on the incoming CPU object"
	| source destination address bitField bitStream byte |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	bitField := RVBitfield new size: (aCPU xlen).
	bitStream := bitField writeStream.
	address := (source value) + self immediateValue.
	byte := aCPU memory byteAt: address.
	1 to: 8 do: [ :bitIndex | 
		bitStream nextPut: (byte bitAt: bitIndex)].
	9 to: 32 do: [ :bitIndex | bitStream nextPut: (byte bitAt: 8)].
	destination value: bitField asUnsignedInteger.
	aCPU incrementPCBy: 4.
	