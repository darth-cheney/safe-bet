as yet unclassified
testExecuteOn
	"Test simple execution on a CPU instance.
	Here we use a basic 32-bit CPU with 1024 bytes memory.
	We expect the (positive, ie 0) amount to be shifted right
	by 3"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x7) value: 2r01000000010001011010000100011101.
	
	instruction := RV32IISRAI new.
	instruction rd setTo: 2. "Destination register x2"
	instruction rs1 setTo: 7. "Source register x7"
	instruction immediateValue: 3. "Shift right by 3"
	instruction executeOn: cpu.
	
	"The source value is positive, so we expect 0's to
	be shifted from the left over to right:
		2r01000000010001011010000100011101
		To:
		2r00001000000010001011010000100011"
	expected := 2r00001000000010001011010000100011.
	self assert: expected equals: (cpu registerNamed: #x2) value.
	