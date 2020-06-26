as yet unclassified
testExecuteOnNeg
	"Test basic execution on a test CPU instance.
	Here we use a basic CPU with 1024  bytes of memory.
	In this example the instruction immediate is a negative value,
	meaning that the address calculation will result in an address
	less that what is present in the source register"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 68.
	cpu memory byteAt: 64 put: 23. "Storing byte 2r00010111"
	
	instruction := RV32IILB new.
	instruction rd setTo: 3. "x3"
	instruction rs1 setTo: 2. "x2"
	instruction immediateValue: -4.
	
	instruction executeOn: cpu.
	self assert: (cpu registerNamed: #x3) value equals: 23.