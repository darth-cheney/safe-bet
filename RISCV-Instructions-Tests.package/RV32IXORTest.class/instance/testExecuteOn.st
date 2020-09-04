as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple CPU instance"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 2r11101110100010101010111010110100.
	(cpu registerNamed: #x3) value: 2r11110110011011010100110101001101.
	
	instruction := RV32IXOR new.
	instruction rs1 setTo: 2. "Source reg x2"
	instruction rs2 setTo: 3. "Source reg x3"
	instruction rd setTo: 4. "Dest register x4"
	instruction executeOn: cpu.
	
	"We expect the following:
		rs1, rs2, rd:
		2r11101110100010101010111010110100
		2r11110110011011010100110101001101
		2r00011000111001111110001111111001"
	expected := 2r00011000111001111110001111111001.
	
	self assert: expected equals: (cpu registerNamed: #x4) value.
		
		