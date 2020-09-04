as yet unclassified
testExecuteOn
	"Test the execution of this instruction on a simple CPU object"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x4) value: 2r11110100010100101010111101010111.
	
	"Shift amount should only be the lower 5 bits of this
	value. Full value unsigned is  4294967267, but should be 3 (lower 5)"
	(cpu registerNamed: #x5) value: 2r11111111111111111111111111100011.
	
	instruction := RV32ISRL new.
	instruction rs1 setTo: 4. "Source reg x4"
	instruction rs2 setTo: 5. "Source reg x5"
	instruction rd setTo: 2. "Dest register x2"
	instruction executeOn: cpu.
	
	"We expect:
		original, shifted (left by 3)
		2r11110100010100101010111101010111
		2r10100010100101010111101010111000"
	expected := 2r10100010100101010111101010111000.
	
	self assert: expected equals: (cpu registerNamed: #x2) value.
		