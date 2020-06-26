as yet unclassified
executeOn: aCPU
	"Execute this instruction on the CPU instance"
	| source destination address bytes bitField bitStream signBit |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	address := (source value) + self immediateValue.
	
	"bytes will be a ByteArray"
	bytes := aCPU memory bytesAt: address numBytes: 2.
	
	bitField := RVBitfield new size: (aCPU xlen).
	bitStream := bitField writeStream.
	bytes do: [ :byteValue | 
		1 to: 8 do: [ :bitIndex | bitStream nextPut: (byteValue bitAt: bitIndex)]].
	signBit := bitField bitAt: 16.
	
	"Now pad the rest of the xlen sized integer with
	the sign bit, in order to sign-extend the loaded value"
	17 to: (aCPU xlen) do: [ :bitIndex | bitField bitAt: bitIndex put: signBit ].
	destination value: bitField asUnsignedInteger.
	aCPU incrementPCBy: 4
	