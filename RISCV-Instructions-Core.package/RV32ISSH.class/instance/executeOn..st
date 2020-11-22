as yet unclassified
executeOn: aCPU
	"Execute this instruction on a CPU object"
	| source1 source2 destAddr data bytes |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	
	destAddr := (source1 asUnsignedInteger) + self immediateValue.
	
	"Data here is the half word, aka the lower 2 bytes (16 bits) of rs2.
	Bitfield >> #asByteArray will return a little-endian array of the bytes"
	data := RVBitfield new fromInteger: (source2 asUnsignedInteger) ofBitSize: 16.
	
	aCPU memory bytesAt: destAddr put: data asByteArrayLittleEndian.
	aCPU incrementPCBy: 4