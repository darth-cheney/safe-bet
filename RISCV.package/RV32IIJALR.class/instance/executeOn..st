as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU instance"
	| destination source result |
	destination := aCPU registerNumbered: self rd asInteger.
	source := aCPU registerNumbered: self rs1 asInteger.
	result := self immediateValue + source value.
	
	"Set the program counter to the result address"
	(aCPU registerNamed: #pc) value: result.
	
	"Store the address of the next instruction in dest"
	destination value: (result + (self lenx / 8)).
	