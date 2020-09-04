as yet unclassified
testExecuteOn
	"Test the execution of this instruction on a simple CPU instance.
	Here we are using a 32 bit CPU with 1024 bytes of addressable
	memory.
	We expect to load a word (here 32 bits) from the
	memory.
	The sign of the loaded value doesn't necessarily matter"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x3) value: 72.
	(cpu memory bytesAt: 80 put: #[ 255 255 255 255 ]). "Full set bits. Will be 4294967295 or -1"
	
	instruction := RV32IILW new.
	instruction rs1 setTo: 3. "Register x3"
	instruction rd setTo: 4. "destination register x4"
	instruction immediateValue: 8. "Add 8 to rs1 to get address"
	instruction executeOn: cpu.
	
	self assert: 4294967295 equals: (cpu registerNamed: #x4) asUnsignedInteger.
	self assert: -1 equals: (cpu registerNamed: #x4) asSignedInteger.
	