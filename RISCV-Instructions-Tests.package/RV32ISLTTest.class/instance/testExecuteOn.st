as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple CPU"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x1) value: -255.
	(cpu registerNamed: #x2) value: -234.
	
	instruction := RV32ISLT new.
	instruction rs1 setTo: 1. "Source register x1"
	instruction rs2 setTo: 2. "Source register x2."
	instruction rd setTo: 3. "Dest register x3"
	instruction executeOn: cpu.
	
	self assert: 1 equals: (cpu registerNamed: #x3) value.