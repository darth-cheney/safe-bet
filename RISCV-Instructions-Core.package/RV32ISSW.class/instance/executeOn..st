as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU object"
	 | source1 source2 destAddr |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	
	destAddr := (source1 asUnsignedInteger) + self immediateValue.
	
	"Note that we reverse the byte array, since Squeak is big-endian but
	RISC-V wants little endian"
	aCPU memory bytesAt: destAddr put: (source2 asUnsignedInteger asByteArray reversed).
	
	aCPU incrementPCBy: 4