as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU object"
	| source destination |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	(source asUnsignedInteger) < (self immediateValue)
		ifTrue: [ destination value: 1 ]
		ifFalse: [ destination value: 0 ].
		
	aCPU incrementPCBy: 4