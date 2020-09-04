as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU instance"
	| source1 source2 destination shiftAmount |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	"Shift amount is the lower 5 bits of rs2"
	shiftAmount := 2r11111 bitAnd: (source2 asUnsignedInteger).
	destination value: (source1 asUnsignedInteger << shiftAmount).
	
	aCPU incrementPCBy: 4
	