as yet unclassified
testExecuteOn
	"Test execution on a basic CPU object.
	We use a basic CPU with 1024 bytes of memory here.
	This tests adds a positive signed immediate to a positive
	value stored in register x2, placing the result into x1."
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 5.
	
	instruction := RV32IIADDI new.
	instruction rd setTo: 1. "x1"
	instruction rs1 setTo: 2. "x2"
	instruction immediateValue: 3. "2r011"
	
	expected := 8.
	instruction executeOn: cpu.
	self assert: expected equals: (cpu registerNamed: #x1) asSignedInteger.
	self assert: expected equals: (cpu registerNamed: #x1) asUnsignedInteger.
	