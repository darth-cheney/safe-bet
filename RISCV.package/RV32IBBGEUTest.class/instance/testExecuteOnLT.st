as yet unclassified
testExecuteOnLT
	"Test basic execution on a test CPU instance.
	Here we use a basic CPU with 1024 bytes of memory.
	We manually set registers x3 to 231 and x4 to 255,
	meaning that the branch should *not* take the jump"
	| cpu instruction expectedPC |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 12. "Start at address 12"
	(cpu registerNamed: #x3) value: 231.
	(cpu registerNamed: #x4) value: 255.
	
	instruction := RV32IBBGEU new.
	instruction rs1 setTo: 3. "x3"
	instruction rs2 setTo: 4. "x4"
	instruction immediateValue: 28. "Jump + 7 instructions forward"
	expectedPC := 12 + 4. "Just the next instruction, since we don't expect to jump"
	
	instruction executeOn: cpu.
	self assert: cpu pcValue equals: expectedPC.