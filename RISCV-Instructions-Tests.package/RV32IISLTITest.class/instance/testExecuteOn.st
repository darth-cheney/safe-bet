as yet unclassified
testExecuteOn
	"Test the execution of this instruction on a simple
	CPU.
	Here we use a basic 32-bit CPU with 1024 bytes of memory.
	This tests expects the 'less than immediate' check to be true,
	and so the target register should be set to 1"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x7) value: -221.
	
	instruction := RV32IISLTI new.
	instruction rs1 setTo: 7. "Source register x7"
	instruction rd setTo: 2. "Destination register x2"
	instruction immediateValue: -220.
	instruction executeOn: cpu.
	
	self assert: 1 equals: (cpu registerNamed: #x2) value.