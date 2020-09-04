as yet unclassified
executeOn: aCPU
	"Perform my task on a given CPU instance."
	| destinationRegister sourceRegister result |
	destinationRegister := aCPU registerNumbered: self rd asInteger.
	sourceRegister := aCPU registerNumbered: self rs1 asInteger.
	result := (sourceRegister value) bitOr: self immediateValue.
	destinationRegister value: result.
	aCPU incrementPCBy: 4.
	
	