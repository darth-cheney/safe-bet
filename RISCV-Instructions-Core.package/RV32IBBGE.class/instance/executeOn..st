as yet unclassified
executeOn: aCPU
	"Execute this instruction on a give CPU instance"
	| source1 source2 |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	
	"We update the PC only if source1 >= source2"
	((source1 value) >= (source2 value))
		ifTrue: [
			aCPU incrementPCBy: self immediateValue ]
		ifFalse: [
			aCPU incrementPCBy: (self xlen / 8) ]