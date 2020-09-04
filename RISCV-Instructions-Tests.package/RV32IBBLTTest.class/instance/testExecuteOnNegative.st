as yet unclassified
testExecuteOnNegative
	"Test basic execution on a test CPU instance, where
	one or both of the register values is a negative number.
	The CPU is basic and has 1024 bytes of memory.
	We set x2 to be -5 and x3 to be 0, meaning that we
	expect to take the jump in this test since x2 < x3."
	| cpu instruction expectedPC |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 8. "Start at address 8"
	(cpu registerNamed: #x2) value: -5.
	(cpu registerNamed: #x3) value: 0.
	
	instruction := RV32IBBLT new.
	instruction rs1 setTo: 2. "x2"
	instruction rs2 setTo: 3. "x3"
	instruction immediateValue: 16. "Will jump 16/8 instructions ahead if true"
	
	"We expect to take the jump, since x2 < x3"
	expectedPC := 8 + 16.
	instruction executeOn: cpu.
	self assert: cpu pcValue equals: expectedPC.