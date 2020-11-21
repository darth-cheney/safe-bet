tests
testExecuteOn
	"Test the execution of this instruction on a simple CPU instance.
	Here we are using a 64-bit CPU with 2048 bytes of addressable memory.
	We expect to load a word (here 32 bits) from memory.
	We are zero-extending the upper 32-bits."
	| cpu instruction |
	cpu := RVCPUBasic64 example2048.
	(cpu registerNamed: #x3) value: 62.
	(cpu memory bytesAt: 80 put: #[ 255 255 255 255 ]). "Full set of bits. Will be 4294967295 or -1"
	
	instruction := RV64IILWU new.
	instruction rs1 setTo: 3. "Source register x3"
	instruction rd setTo: 5. "Dest register x5"
	instruction immediateValue: 18. "Add 18 to rs1 to get starting address"
	instruction executeOn: cpu.
	
	"We expect a register value of:
		2r0000000000000000000000000000000011111111111111111111111111111111
	Which has the same signed and unsigned value"
	self assert: 4294967295 equals: (cpu registerNamed: #x5) asUnsignedInteger.
	self assert: 4294967295 equals: (cpu registerNamed: #x5) asSignedInteger.
	