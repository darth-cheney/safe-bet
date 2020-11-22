tests
testExecuteOn
	"Test execution of this instruction on a basic
	64-bit CPU instance with 2048 bytes of memory"
	| cpu instruction expected |
	cpu := RVCPUBasic64 example2048.
	(cpu registerNamed: #x3) value: 888. "Before immediate, we start at addr 888"
	(cpu registerNamed: #x6) value: 2r1001011010010001010001110111011110101010010101011010100101101101.
	
	instruction := RV64ISSD new.
	instruction rs1 setTo: 3. "Source reg x3"
	instruction rs2 setTo: 6. "Source reg x6"
	instruction immediateValue: 16. "We should save at address 888 + 16 (904)"
	instruction executeOn: cpu.
	
	"We expect to save little-endian bytes"
	expected := #[ 109 169 85 170 119 71 145 150 ].
	self assert: expected equals: (cpu memory bytesAt: (888 + 16) numBytes: 8)