as yet unclassified
testExecuteOnNeg
	"Test execution of ADDI that uses a negative immediate value.
	Here we use a basic CPU with 1024 memory.
	The register x1 will be set to 255 and the immediate
	will be -5. We will store the result in x2"
	| cpu instruction expected1 |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x1) value: 255.
	
	instruction := RV32IIADDI new.
	instruction rd setTo: 2. "x2"
	instruction rs1 setTo: 1. "x1"
	instruction immediateValue: -5.
	instruction executeOn: cpu.
	
	"expected1 is gives us the value if we treat x1 as signed"
	expected1 := 250.
	self assert: expected1 equals: (cpu registerNamed: #x2) asSignedInteger.
	self assert: expected1 equals: (cpu registerNamed: #x2) asUnsignedInteger.