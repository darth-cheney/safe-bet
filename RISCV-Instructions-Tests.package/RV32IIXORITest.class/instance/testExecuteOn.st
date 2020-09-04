as yet unclassified
testExecuteOn
	"Test the execution of this instruction on a simple CPU.
	Here we use the basic 32-bit CPU with 1024 bytes of memory.
	We expect the immediate to be sign extended!"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x4) value: 2r11001100110011001100110011001100.
	
	instruction := RV32IIXORI new.
	instruction rs1 setTo: 4. "Source register x4"
	instruction rd setTo: 12. "Destination register x12"
	
	"Will be sign extended to:
		2r11111111111111111111111110111011"
	instruction immediateValue: 2r111110111011.
	instruction executeOn: cpu.
	
	"We expect:
		Source, ext-imm, result
		2r11001100110011001100110011001100
		2r11111111111111111111111110111011
		2r00110011001100110011001101110111."
	expected := 2r00110011001100110011001101110111.
	
	self assert: expected equals: (cpu registerNamed: #x12) value.
		