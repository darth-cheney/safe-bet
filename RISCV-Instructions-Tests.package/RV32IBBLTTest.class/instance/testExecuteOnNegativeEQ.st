as yet unclassified
testExecuteOnNegativeEQ
	"Test basic execution on a test CPU instance, where
	one or both of the register values is a negative number.
	The CPU is basic and has 1024 bytes of memory.
	We set x2 and x3 to both be -11, meaning that we
	do *not* expect to take the jump in this test since x2 = x3."
	| cpu instruction expectedPC |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 8. "Start at address 8"
	(cpu registerNamed: #x2) value: -11.
	(cpu registerNamed: #x3) value: -11.
	
	instruction := RV32IBBLT new.
	instruction rs1 setTo: 2. "x2"
	instruction rs2 setTo: 3. "x3"
	instruction immediateValue: 16. "Will jump 16/8 instructions ahead if true"
	
	"We expect to *not* take the jump, since x2 = x3"
	expectedPC := 8 + 4.
	instruction executeOn: cpu.
	self assert: cpu pcValue equals: expectedPC.