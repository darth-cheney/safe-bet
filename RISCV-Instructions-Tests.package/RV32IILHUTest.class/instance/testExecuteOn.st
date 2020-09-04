as yet unclassified
testExecuteOn
	"Test the execution of this instruction on a simple CPU instance.
	Here we are using a 32 bit CPU with 1024 bytes of addressable
	memory.
	We expect to load a sign-extended half-word (16bits) from the
	memory.
	The loaded value should NOT be sign extended"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 19.
	(cpu memory bytesAt: 21 put: #[ 255 255 ]). "2r1111111111111111, should not be extended"
	
	instruction := RV32IILHU new.
	instruction rd setTo: 3. "Destination is register x3."
	instruction rs1 setTo: 2. "Source is register x2"
	instruction immediateValue: 2.
	instruction executeOn: cpu.
	
	"Because we do not extend the sign bit(s), the value of unsigned and signed
	should both be the same"
	self assert: (cpu registerNamed: #x3) asUnsignedInteger equals: 65535.
	self assert: (cpu registerNamed: #x3) asSignedInteger equals: 65535.