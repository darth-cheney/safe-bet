as yet unclassified
testExecuteOnFalse
	"Test execution of this instruction on a simple CPU.
	Here we use the basic 32-bit CPU with 1024 bytes memory.
	We test the *false* case where rs1 is not less than the immediate,
	so we expect the destination register to contain 0"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x4) value: 1028.
	
	instruction := RV32IISLTIU new.
	instruction rs1 setTo: 4. "Source register x4"
	instruction rd setTo: 13. "Destination register x13"
	instruction immediateValue: 1027.
	instruction executeOn: cpu.
	
	self assert: 0 equals: (cpu registerNamed: #x13) value.