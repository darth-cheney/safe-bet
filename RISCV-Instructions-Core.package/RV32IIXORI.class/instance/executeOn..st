as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU instance"
	| source destination |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	destination value: ((source asUnsignedInteger) bitXor: (self immediateValue)).
	aCPU incrementPCBy: 4