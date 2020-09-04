as yet unclassified
testExecuteOnNeg
	"Test execution of this instruction on a simple CPU instance.
	Note here we test with a signed negative immediate offset,
	so the jump should decrement the PC location."
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 256. "Begin at address 256"
	
	instruction := RV32IJJAL new.
	instruction rd setTo: 1. "Dest register x1. Stores the address after the jump"
	instruction immediateValue: 2r11111111111111101101. "Should be -19 signed, but will output at -20 (2byte rounding per spec)"
	instruction executeOn: cpu.
	
	"We expect the new PC to be -20 + 256 (236) and for
	rd to be set to 260."
	self assert: 236 equals: (cpu registerNamed: #pc) value.
	self assert: 260 equals: (cpu registerNamed: #x1) value.