as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU object"
	| source1 source2 destAddr bytes |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	
	destAddr := (source1 asUnsignedInteger) + self immediateValue.
	
	"We create and store a little-endian byte array of the correct size
	using RVBitfield"
	bytes := RVBitfield new fromInteger: (source2 asUnsignedInteger) ofBitSize: 64.
	aCPU memory bytesAt: destAddr put: bytes asByteArrayLittleEndian.
	
	aCPU incrementPCBy: 4