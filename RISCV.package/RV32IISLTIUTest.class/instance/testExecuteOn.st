as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple CPU.
	Here we use the basic 32-bit CPU with 1024 bytes memory.
	We test the *trye* case where rs1 is in fact less than the immediate,
	so we expect the destination register to contain 1"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x9) value: 5.
	
	instruction := RV32IISLTIU new.
	instruction rs1 setTo: 9. "Source register x9"
	instruction rd setTo: 11. "Destination register x11"
	
	"We are being tricky here: -1 unsigned will
	be a large number for a 12 bit immediate (4095)
	so it is, in fact, greater than rs1"
	instruction immediateValue: -1.
	instruction executeOn: cpu.
	
	self assert: 1 equals: (cpu registerNamed: #x11) value.
	