tests
testExecuteOn
	"Test the execution of this instruction on a simple CPU instance.
	Here we are using a 64-bit CPU with 2048 bytes of addressable memory.
	We expect to load a double (here 64 bits) from memory.
	Because we are testing in a 64 bit system, there is no sign extension,
	but we can still test both signs in the results"
	| cpu instruction |
	cpu := RVCPUBasic64 example2048.
	(cpu registerNamed: #x9) value: 400.
	
	"The following memory contents should represent:
		2r1111111100000000111111110000000000000000111111110000000011111111
		
	Which is  18374966855153418495 or -71777218556133121"
	(cpu memory bytesAt: 800 put: #[ 255 0 255 0 0 255 0 255 ]).
	
	instruction := RV64IILD new.
	instruction rs1 setTo: 9. "Source register x9"
	instruction rd setTo: 1. "Dest register x1"
	instruction immediateValue: 400. "Add 400 to rs1 to get the starting address"
	instruction executeOn: cpu.
	
	self assert: 18374966855153418495 equals: (cpu registerNamed: #x1) asUnsignedInteger.
	self assert: -71777218556133121 equals: (cpu registerNamed: #x1) asSignedInteger.