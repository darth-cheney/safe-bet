as yet unclassified
testExecuteOn
	"Test the execution of this instruction on a simple CPU."
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x6) value: 2r01000101000100010101111100101011.
	(cpu registerNamed: #x7) value: 2r11111111111111111111111111100011. "Should only take lower 5 bits"
	
	instruction := RV32ISRA new.
	instruction rs1 setTo: 6. "Source reg x6"
	instruction rs2 setTo: 7. "Source reg x7; shift amount in lower 5 bits"
	instruction rd setTo: 8. "Dest register x8"
	instruction executeOn: cpu.
	
	"We expect to shift right by 3:
		from, to:
		2r01000101000100010101111100101011
		2r00001000101000100010101111100101"
	expected := 2r00001000101000100010101111100101.
	self assert: expected equals: (cpu registerNamed: #x8) value.