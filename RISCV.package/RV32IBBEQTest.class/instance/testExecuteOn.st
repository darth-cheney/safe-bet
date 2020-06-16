as yet unclassified
testExecuteOn
	"Test basic execution on a test CPU instance.
	Here we use a basic CPU with 1024 bytes of memory.
	We manually set registers x2 and x3 to both be 255,
	meaning that the branch should jump to the PC + immediate."
	| cpu instruction expectedPC |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 64. "Start at address 64"
	(cpu registerNamed: #x2) value: 255.
	(cpu registerNamed: #x3) value: 255.
	
	instruction := RV32IBBEQ new.
	instruction rs1 setTo: 2. "x2"
	instruction rs2 setTo: 3. "x3"
	instruction immediateValue: 16.
	expectedPC := (64 + 16).
	instruction executeOn: cpu.
	
	self assert: cpu pcValue equals: expectedPC.
	
	