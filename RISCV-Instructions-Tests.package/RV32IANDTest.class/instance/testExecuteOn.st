as yet unclassified
testExecuteOn
	"Test basic execution on a test CPU object.
	Here we are using a basic CPU with 1024 bytes
	of memory."
	| cpu expected instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x5) value: 2r00000101001110011010001001111010.
	(cpu registerNamed: #x6) value: 2r00110001000101011001001000000001.
	
	instruction := RV32IAND new.
	instruction rd setTo: 1. "x1"
	instruction rs1 setTo: 5. "x5"
	instruction rs2 setTo: 6. "x6"
	
	expected := 2r00000001000100011000001000000000.
	instruction executeOn: cpu.
	self assert: (cpu registerNamed: #x1) value equals: expected.