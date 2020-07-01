as yet unclassified
executeOn: aCPU
	"Execute myself on a given CPU instance"
	| source destination |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	"Logical shift left by the amount in the immediate"
	destination value: ((source asUnsignedInteger) << self immediateValue).
	
	aCPU incrementPCBy: 4.