as yet unclassified
executeOn: aCPU
	"Execute this instruction using a given CPU instance"
	| destination offset |
	destination := aCPU registerNumbered: self rd asInteger.
	offset := self immediateValue + aCPU pcValue.
	destination value: offset.
	aCPU incrementPCBy: 4
	