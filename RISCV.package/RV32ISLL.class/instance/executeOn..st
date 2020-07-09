as yet unclassified
executeOn: aCPU
	"Execute this instruction on the given CPU instance"
	| source1 source2 shamtBitField destination |
	
	"Source1 contains the bits to be shifted"
	source1 := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	"Source2's lower 5 bits represent the shift amount. It's unclear
	if this should be signed or unsigned, so here we assume unsigned"
	source2 := aCPU registerNumbered: self rs2 asInteger.
	shamtBitField := RVBitfield new size: 5.
	1 to: 5 do: [:bitIndex | shamtBitField bitAt: bitIndex put: (source2 value bitAt: bitIndex)].
	
	destination value: (source1 value) << shamtBitField asUnsignedInteger.
	aCPU incrementPCBy: 4.
	