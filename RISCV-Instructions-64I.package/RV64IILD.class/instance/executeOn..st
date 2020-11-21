as yet unclassified
executeOn: aCPU
	"Execiute this instruction on the given CPU instance"
	| source destination bitField bitStream address signBit |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	address := (source value) + self immediateValue.
	
	bitField := RVBitfield new size: (aCPU xlen).
	bitStream := bitField writeStream.
	
	"Fetch a byte array of 8 bytes (64 bit double length) starting
	as the given memory address"
	(aCPU memory bytesAt: address numBytes: 8) do: [ :byteValue |
		1 to: 8 do: [ :bitIndex | bitStream nextPut: (byteValue bitAt: bitIndex) ] ].
	
	"Sign-extend the 64th bit to the rest of the length of the
	bitfield. This only applies in cases where the xlen of the system is
	> 64 bits."
	(aCPU xlen > 64)
		ifTrue: [ 
			signBit := bitField bitAt: 64.
			(aCPU xlen - 64) timesRepeat: [ 
				bitStream nextPut: signBit ] ].
		
	"Put the resulting value into the register"
	destination value: bitField asUnsignedInteger.
	aCPU incrementPCBy: 4