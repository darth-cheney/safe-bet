as yet unclassified
executeOn: aCPU
	"Execute this instruction using a CPU instance"
	| source1 source2 |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	(source1 value) < (source2 value)
		ifTrue: [ 
			"Jump to current PC address plus immediate"
			aCPU incrementPCBy: self immediateValue ]
		ifFalse: [
			aCPU incrementPCBy: 4 ]