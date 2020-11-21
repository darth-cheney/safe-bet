as yet unclassified
executeOn: aCPU
	"Execute this instruction on the given CPU instance"
	| source destination bitField bitStream address signBit |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	address := (source value) + self immediateValue.
	
	bitField := RVBitfield new size: (aCPU xlen).
	bitStream := bitField writeStream.
	"Fetch a byte array of 4 bytes (32 bit word length) starting
	at the given memory address"
	(aCPU memory bytesAt: address numBytes: 4) do: [ :byteValue |
		1 to: 8 do: [ :bitIndex | bitStream nextPut: (byteValue bitAt: bitIndex )]].
	
	"Sign-extend the 32nd bit to the rest of the length of the bitfield.
	This only applies in cases where the xlen of the system is > 32bits."
	(aCPU xlen > 32)
		ifTrue: [ 
			signBit := bitField bitAt: 32.
			(aCPU xlen - 32) timesRepeat: [ 
				bitStream nextPut: signBit ] ].
	
	"Put the resulting value into the register"
	destination value: bitField asUnsignedInteger.
	aCPU incrementPCBy: 4