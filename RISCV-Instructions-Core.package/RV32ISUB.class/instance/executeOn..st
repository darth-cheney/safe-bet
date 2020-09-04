as yet unclassified
executeOn: aCPU
	"Execute this instruction on a CPU object"
	| source1 source2 destination |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	destination value: ((source1 asUnsignedInteger) - (source2 asUnsignedInteger)).
	
	aCPU incrementPCBy: 4.