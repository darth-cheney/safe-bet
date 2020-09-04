as yet unclassified
testExecuteOnEQ
	"Test a basic execution of this instruction on a simple
	CPU instance. Note that we use a basic CPU with 1024
	bytes of memory.
	In this example, we set registers x7 and x6 both to 101,
	and therefore we expect *not* to take the branch"
	| cpu instruction expectedPC |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 8. "Start at address 8"
	(cpu registerNamed: #x7) value: 101.
	(cpu registerNamed: #x6) value: 101.
	
	instruction := RV32IBBNE new.
	instruction rs1 setTo: 7. "x7"
	instruction rs2 setTo: 6. "x6"
	instruction immediateValue: 28.
	
	"The values are not equal, so we expect to
	*not* take the branching jump"
	expectedPC := 8 + 4.
	
	instruction executeOn: cpu.
	self assert: cpu pcValue equals: expectedPC.