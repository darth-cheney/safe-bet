as yet unclassified
executeOn: aCPU
	"Execute this instruction using the incoming CPU object"
	| source destination |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	destination value: ((self immediateValue) bitAnd: (source asUnsignedInteger)).
	aCPU incrementPCBy: 4