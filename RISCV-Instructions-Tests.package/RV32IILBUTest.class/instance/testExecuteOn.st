as yet unclassified
testExecuteOn
	"Test basic execution on a test CPU instance.
	Here we use a basic CPU with 1024  bytes of memory"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 12.
	
	"To ensure the loaded value is NOT sign extended,
	we use 255, whose twos complement would give us
	-1 as a value if the sign was extended."
	(cpu memory byteAt: 16 put: 255).
	
	instruction := RV32IILBU new.
	instruction rd setTo: 3. "x3"
	instruction rs1 setTo: 2. "x2"
	instruction immediateValue: 4.
	instruction executeOn: cpu.
	
	self assert: (cpu registerNamed: #x3) asUnsignedInteger equals: 255.
	self assert: (cpu registerNamed: #x3) asSignedInteger equals: 255.