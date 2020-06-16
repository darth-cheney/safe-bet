as yet unclassified
executeOn: aCPU
	"Execute this instruction using a given CPU instance"
	| source1 source2 |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	
	((source1 value) = (source2 value))
		ifFalse: [
			aCPU incrementPCBy: self immediateValue ]
		ifTrue: [
			aCPU incrementPCBy: (self xlen / 8) ]