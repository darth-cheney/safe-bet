as yet unclassified
executeOn: aCPU
	"Execute this instruction on a CPU object"
	| source1 source2 destination |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	
	(source1 asSignedInteger) < (source2 asSignedInteger)
		ifTrue: [ 
			destination value: 1 ]
		ifFalse: [
			destination value: 0 ].
		
	aCPU incrementPCBy: 4