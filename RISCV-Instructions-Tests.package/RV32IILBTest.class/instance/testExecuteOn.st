as yet unclassified
testExecuteOn
	"Test basic execution on a test CPU instance.
	Here we use a basic CPU with 1024  bytes of memory"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 0.
	cpu memory byteAt: 50 put: 23. "Storing byte 2r00010111"
	
	instruction := RV32IILB new.
	instruction rd setTo: 3. "x3"
	instruction rs1 setTo: 2. "x2"
	instruction immediateValue: 50.
	
	instruction executeOn: cpu.
	self assert: (cpu registerNamed: #x3) value equals: 23.