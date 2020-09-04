as yet unclassified
testExecuteOnFalse
	"Test the execution of this instruction on a simple
	CPU.
	Here we use a basic 32-bit CPU with 1024 bytes of memory.
	This tests expects the 'less than immediate' check to be
	*false*, so we set the destination register to 0"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x7) value: 253.
	
	instruction := RV32IISLTI new.
	instruction rs1 setTo: 7. "Source register x7"
	instruction rd setTo: 2. "Destination register x2"
	instruction immediateValue: -15.
	instruction executeOn: cpu.
	
	self assert: 0 equals: (cpu registerNamed: #x2) value.