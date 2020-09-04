as yet unclassified
testExecuteOnLT
	"Test a basic execution of this instruction on a simple
	CPU instance. Note that we use a 1024 byte memory.
	Note: this basic test only deals with unsigned values.
	Here we test the comparison being false (its less-than),
	meaning we expect the CPU to *not* take the branch and
	for the PC to remain the initial value."
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 32. "Set the starting address to 32"
	(cpu registerNumbered: 3) value: 7. "Will be rs2"
	(cpu registerNumbered: 4) value: 5. "Will be rs1"
	
	instruction := RV32IBBGE new.
	instruction rs1 setTo: 4. "Register x4"
	instruction rs2 setTo: 3. "Register x3"
	instruction immediateValue: 32. "If we branch, add 32 to the current PC"
	
	"Here, x4 (5) is less than x3 (7) so we expect not to branch,
	but to increment by the normal amount"
	instruction executeOn: cpu.
	self assert: cpu pcValue equals: 32 + (instruction xlen / 8).