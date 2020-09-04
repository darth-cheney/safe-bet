as yet unclassified
testExecuteOn
	"Test basic execution on a test CPU instance.
	Here we use a basic CPU with 1024 bytes of memory.
	Here we are adding two small positive integers from x1 and x2
	respectively and storing the result in x3"
	| cpu instruction expectedValue |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x1) value: 3.
	(cpu registerNamed: #x2) value: 5.
	
	instruction := RV32IADD new.
	instruction rd setTo: 3. "Destination is x3"
	instruction rs1 setTo: 2. "First source is x2"
	instruction rs2 setTo: 1. "Second source is x1"
	expectedValue := (5 + 3).
	
	instruction executeOn: cpu.
	
	self assert: (cpu registerNamed: #x3) value equals: expectedValue.
	