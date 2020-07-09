as yet unclassified
testExecuteOn
	"Test simple execution on a CPU instance."
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x7) value: 2r11101110100111101000101010111000. " 4003367608"
	
	"Should only take lower 5 bits, aka 2r011 aka 3"
	(cpu registerNamed: #x2) value: 2r11111111111111111111111111100011. " 4294967267, but 3" 
	
	instruction := RV32ISLL new.
	instruction rs1 setTo: 7. "Source x7"
	instruction rs2 setTo: 2. "Source shift amount x2"
	instruction rd setTo: 9. "Destination register x9"
	instruction executeOn: cpu.
	
	expected := 2r01110100111101000101010111000000.
	self assert: expected equals: (cpu registerNamed: #x9) value.