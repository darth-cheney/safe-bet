as yet unclassified
executeOn: aCPU
	"Execute this instruction on a CPU instance"
	| source1 source2 destination sourceVal shiftAmount bitField |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	"The shift amount is the lower 5 bits of rs2"
	shiftAmount := 2r11111 bitAnd: (source2 value).
	
	"An arithmetic shift is a shift that preserves the sign bit"
	bitField := RVBitfield new size: aCPU xlen.
	sourceVal := source1 asSignedInteger.
	sourceVal > 0
		ifTrue: [
			1 to: (bitField size) do: [:bitIndex |
				bitField bitAt: bitIndex put: (sourceVal bitAt: (bitIndex + shiftAmount))].
			destination value: bitField asUnsignedInteger ]
		ifFalse: [
			1 to: (bitField size) do: [:bitIndex |
				bitField bitAt: bitIndex put: (sourceVal bitAt: (bitIndex + shiftAmount))].
			(aCPU xlen) to: (aCPU xlen - shiftAmount) do: [:signIndex |
				bitField bitAt: signIndex put: 1 ].
			destination value: bitField asUnsignedInteger ].
	aCPU incrementPCBy: 4
	