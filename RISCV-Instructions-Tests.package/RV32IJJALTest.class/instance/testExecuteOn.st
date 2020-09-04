as yet unclassified
testExecuteOn 
	"Test the basic execution on a simple CPU instance"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 16. "Begin at address 16"
	
	instruction := RV32IJJAL new.
	instruction rd setTo: 1. "Destination register x1. Stores after-jump instruction"
	instruction immediateValue: 2r00000000000001011011. "91, but rounded to 90 (2byte)"
	instruction executeOn: cpu.
	
	"We expect the PC to jump to 90 + 16 (106) and
	for 16 + 4 (20) to be stored in rd"
	self assert: 106 equals: (cpu registerNamed: #pc) value.
	self assert: 20 equals: (cpu registerNamed: #x1) value.
	