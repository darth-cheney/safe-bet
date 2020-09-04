as yet unclassified
testExecuteOn
	"Test the execution of this instruction on a simple CPU instance.
	Here we use the basic 32-bit CPU with 1024 bytes memory.
	We will right logical (ignore sign bit) shift by 5."
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x12) value: 2r11111111111111111011111111111011.
	
	instruction := RV32IISRLI new.
	instruction rs1 setTo: 12. "Source register x12"
	instruction rd setTo: 3. "Destination register x3"
	instruction immediateValue: 5.
	instruction executeOn: cpu.
	
	"We expect to go from:
		2r11111111111111111011111111111011
		To:
		2r00000111111111111111110111111111"
	expected := 2r00000111111111111111110111111111.
	self assert: expected equals: (cpu registerNamed: #x3) value.