as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple CPU instance.
	This instruction tests unsigned values. We expect this test
	to evaluate to false (0), since rs1 is greater than rs2 when
	unsigned (but is less than when signed)"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	
	"Value is  2214658048 unsigned,  -2080309248 signed. We expect to only compare
	the unsigned value!"
	(cpu registerNamed: #x8) value: 2r10000100000000010000000000000000.
	
	"Value is  32769 unsigned,  32769 signed. We expect only to compare the
	unsigned values!"
	(cpu registerNamed: #x9) value: 2r00000000000000001000000000000001.
	
	instruction := RV32ISLTU new.
	instruction rs1 setTo: 8. "Source register x8"
	instruction rs2 setTo: 9. "Source register x9"
	instruction rd setTo: 10. "Dest register x10."
	instruction executeOn: cpu.
	
	self assert: 0 equals: (cpu registerNamed: #x10) value.