as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple CPU instance.
	Here we use the basic cpu with 1024 bytes of memory"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x6) value: 64.
	
	"Should only take lower 8 bits (byte) and store"
	(cpu registerNamed: #x7) value: 2r11111111111111111111111011101111. " 239"
	
	instruction := RV32ISSB new.
	instruction rs1 setTo: 6. "Source register x6"
	instruction rs2 setTo: 7. "Source register x7"
	instruction immediateValue: -4. "Should load to address 64 - 4 = (60)"
	instruction executeOn: cpu.
	
	expected := #[ 239 ].
	self assert: expected equals: (cpu memory bytesAt: 60 numBytes: 1).