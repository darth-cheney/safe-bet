as yet unclassified
testExecuteOn
	"Test execution of this instruction on a
	basic CPU.
	Here we use a 32 bit CPU with 1024 bytes of memory.
	We expect the result to be logically shifted (disregards sign bit)
	to the left."
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x4) value: 2r11000000000000000000000000000101.
	
	instruction := RV32IISLLI new.
	instruction rs1 setTo: 4. "Source register x4"
	instruction rd setTo: 2. "Destination register x2"
	instruction immediateValue: 29. "Should shift left by 29"
	instruction executeOn: cpu.
	
	"We expect the little-end 101 to be at the big end, ie:
		2r11000000000000000000000000000101
	becomes:
		2r10100000000000000000000000000000"
	expected := 2r10100000000000000000000000000000.
	self assert: expected equals: (cpu registerNamed: #x2) asUnsignedInteger.