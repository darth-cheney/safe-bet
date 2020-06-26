as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU instance"
	| source destination address bitField byte |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	address := (source value) + self immediateValue.
	byte := aCPU memory byteAt: address.
	bitField := RVBitfield new size: (aCPU xlen).
	1 to: 8 do: [ :bitIndex |
		bitField bitAt: bitIndex put: (byte bitAt: bitIndex)].
	"Because this is the unsigned version, we do not sign extend.
	RVBitfield will have already initialized with all 0s already"
	destination value: bitField asUnsignedInteger.
	aCPU incrementPCBy: 4
	
	