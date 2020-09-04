as yet unclassified
testExecuteOn
	"Test the execution of ANDI on a simple CPU.
	We use a basic CPU instance with 1024 bytes of memory.
	Register x1 will be our source and x4 our destination.
	Note that the 12-bit immediate will be sign extended to 32 bits."
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x1) value: 2r00000100000100000100000000110101.
	
	instruction := RV32IIANDI new.
	instruction rd setTo: 4. "x4"
	instruction rs1 setTo: 1. "x1"
	instruction immediateValue: -1. "Should sign extend to 2r11111111111111111111111111111111"
	instruction executeOn: cpu.
	
	expected := 2r00000100000100000100000000110101.
	self assert: expected equals: (cpu registerNamed: #x4) value.