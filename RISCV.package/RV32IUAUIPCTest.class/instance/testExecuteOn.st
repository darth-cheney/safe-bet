as yet unclassified
testExecuteOn
	"Test basic execution on a test CPU instance.
	Here we use a basic CPU with 1024 bytes of memory"
	| cpu instruction expectedOffset |
	cpu := RVCPUBasic example1024.
	cpu incrementPCBy: 32. "We begin at address 32"
	
	instruction := RV32IUAUIPC new.
	instruction rd setTo: 6. "Set destination to register x6"
	instruction immediateValue: 2r11101110111001101100000000000000 "4008099840".
	expectedOffset := (2r11101110111001101100000000000000 + 32).
	
	instruction executeOn: cpu.
	
	self assert: (cpu registerNumbered: 6) value equals: expectedOffset.
	
	
	