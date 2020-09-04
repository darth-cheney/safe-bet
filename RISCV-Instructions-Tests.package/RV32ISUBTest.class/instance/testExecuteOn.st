as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple CPU instance"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x8) value: 478635.
	(cpu registerNamed: #x9) value: 468631.
	
	instruction := RV32ISUB new.
	instruction rs1 setTo: 8. "Source register x8"
	instruction rs2 setTo: 9. "Source register x9"
	instruction rd setTo: 10. "Dest register x10"
	instruction executeOn: cpu.
	
	self assert: 10004 equals: (cpu registerNamed: #x10) value.