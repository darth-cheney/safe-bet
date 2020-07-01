as yet unclassified
testExecuteOn
	"Test basic execution of this instruction on a CPU.
	Here we use a simple CPU with 1024 bytes of memory.
	We expect the 12-bit immediate value to be sign extended
	before the bitwise OR comparison (see comments below)"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x5) value: 2r11110010011111111110001011011011.
	
	instruction := RV32IIORI new.
	instruction rd setTo: 8. "Destination register x8"
	instruction rs1 setTo: 5. "Source register x5"
	
	"The immediate should be sign-extended to:
		2r11111111111111111111100101101110"
	instruction immediateValue: 2r100101101110.
	
	"We expect:
		rs1, imm, result:
		2r11110010011111111110001011011011
		2r11111111111111111111100101101110
		2r11111111111111111111101111111111"
	expected := 2r11111111111111111111101111111111.
	
	instruction executeOn: cpu.
	self assert: expected equals: (cpu registerNamed: #x8) asUnsignedInteger.