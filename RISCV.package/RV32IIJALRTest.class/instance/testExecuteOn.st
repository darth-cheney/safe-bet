as yet unclassified
testExecuteOn
	"Test basic execution on a test CPU instance.
	Here we use a basic CPU with 1024  bytes of memory"
	| cpu instruction expectedAddress expectedStoredValue |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 8. "We begin at address 8"
	(cpu registerNamed: #x3) value: 5. "Manually set the value in the rs1 to 5"
	
	instruction := RV32IIJALR new.
	instruction rd setTo: 2. "Destination will be x2"
	instruction rs1 setTo: 3. "Source register to add immediate to will be x3."
	instruction immediateValue: 2r000101101101. "12-bit immediate, which will be sign-extended to 32-bits"
	expectedAddress := 2r000101101101 + 5. "100101110010"
	expectedStoredValue := expectedAddress + (instruction xlen / 8).
	
	instruction executeOn: cpu.
	
	self assert: (cpu registerNamed: #x2) value equals: expectedStoredValue.
	self assert: cpu pcValue equals: expectedAddress.