as yet unclassified
executeOn: aCPU
	"Execute this instruction on a CPU object"
	| source1 source2 destAddr data |
	source1 := aCPU registerNumbered: self rs1 asInteger.
	source2 := aCPU registerNumbered: self rs2 asInteger.
	
	destAddr := (source1 asUnsignedInteger) + self immediateValue.
	
	"Data here is the half word, aka the lower 2 bytes (16 bits) of rs2"
	data := (source2 asUnsignedInteger) bitAnd: 2r1111111111111111.
	
	"Note that we have to reverse the bytearray we are putting in, since
	Squeak is big-endian but RISC-V expects little endian"
	aCPU memory bytesAt: destAddr put: (data asByteArray reversed).
	aCPU incrementPCBy: 4