as yet unclassified
testExecuteOn
	"Test simple execution of this instruction"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x4) value: 2r11100100010100010101111101001010.
	(cpu registerNamed: #x5) value: 2r00101101011010010101101111010111.
	
	instruction := RV32IOR new.
	instruction rs1 setTo: 4. "Source register x4."
	instruction rs2 setTo: 5. "Source register x5"
	instruction rd setTo: 6. "Dest register x6"
	instruction executeOn: cpu.
	
	"We expect:
		rs1, rs2, rd:
		2r11100100010100010101111101001010
		2r00101101011010010101101111010111
		2r11101101011110010101111111011111."
	expected := 2r11101101011110010101111111011111.
	self assert: expected equals: (cpu registerNamed: #x6) value.
		