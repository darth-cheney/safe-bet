as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU object"
	| source destination |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	destination value: (source asUnsignedInteger >> self shamt asInteger).
	aCPU incrementPCBy: 4.