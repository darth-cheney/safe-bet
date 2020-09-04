as yet unclassified
testExecuteOn
	"Test execution of this instruction on a CPU object.
	We use a basic CPU instance with 1024 bytes of memory.
	This instruction treats its source registers as unsigned values.
	Our source registers are x9 and x10.
	We expect the first source to be less than the second,
	and for the instruction to take the jump."
	| cpu instruction expectedPC |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 64. "Start at address 64"
	(cpu registerNamed: #x9) value: 17894.
	(cpu registerNamed: #x10) value: 18000.
	
	instruction := RV32IBBLTU new.
	instruction rs1 setTo: 9. "x9"
	instruction rs2 setTo: 10. "x10"
	instruction immediateValue: 16. "Will  jump forward 4 instructions"
	instruction executeOn: cpu.
	
	expectedPC := 64 + 16.
	self assert: expectedPC equals: cpu pcValue
	
	