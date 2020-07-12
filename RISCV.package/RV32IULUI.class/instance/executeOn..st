as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given cpu object"
	| destination |
	destination := aCPU registerNumbered: self rd asInteger.
	
	destination value: (self immediateValue).
	
	aCPU incrementPCBy: 4