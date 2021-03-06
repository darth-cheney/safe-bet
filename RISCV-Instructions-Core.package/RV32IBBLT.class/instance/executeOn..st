as yet unclassified
executeOn: aCPU
	"Execute this instruction using a given CPU instance"
	| source1 source2 |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	
	((source1 asSignedInteger) < (source2 asSignedInteger))
		ifTrue: [
			aCPU incrementPCBy: self immediateValue ]
		ifFalse: [
			aCPU incrementPCBy: (self xlen / 8) ]