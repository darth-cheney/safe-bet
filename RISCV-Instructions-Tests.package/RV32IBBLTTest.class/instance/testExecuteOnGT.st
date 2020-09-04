as yet unclassified
testExecuteOnGT
	"Test basic executeion on a test CPU instance.
	Here we use a basic CPU with 1024 bytes of memory.
	We manually set registers x5 to be 42 and x3 to be 10,
	comparing the former to the latter (which should evaluate to false).
	We thus expect *not* to take the jump in this test."
	| cpu instruction expectedPC |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 12. "Start at address 12"
	(cpu registerNamed: #x5) value: 42.
	(cpu registerNamed: #x3) value: 10.
	
	instruction := RV32IBBLT new.
	instruction rs1 setTo: 5. "x5"
	instruction rs2 setTo: 3. "x3"
	instruction immediateValue: 36. "Jump forward by 36/4 instructions"
	"We expect not to take the jump, since x5val > x3val"
	expectedPC := 12 + 4.
	
	instruction executeOn: cpu.
	self assert: cpu pcValue equals: expectedPC.