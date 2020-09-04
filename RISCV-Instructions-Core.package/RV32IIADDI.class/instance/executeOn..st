as yet unclassified
executeOn: aCPU
	"Execute this instruction using a given CPU instance"
	| source destination immediate |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	immediate := self immediateValue.
	destination value: (immediate + (source value)).
	aCPU incrementPCBy: 4