as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU object"
	| source1 source2 destAddr data |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	
	destAddr := (self immediateValue) + (source1 asUnsignedInteger).
	
	"We store a byte, ie only the lower 8 bits of rs2"
	data := RVBitfield new fromInteger: (source2 asUnsignedInteger) ofBitSize: 8.
	
	aCPU memory bytesAt: destAddr put: (data asByteArrayLittleEndian).
	aCPU incrementPCBy: 4.
	