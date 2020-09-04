as yet unclassified
testExecuteOnNeg
	"Test simple execution on a CPU instance.
	Here we use a basic 32-bit CPU with 1024 bytes memory.
	We expect the (negative, ie 1) amount to be shifted right
	by 3"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x4) value: 2r10010000100111101010010101101011.
	
	instruction := RV32IISRAI new.
	instruction rs1 setTo: 4. "Source register x4"
	instruction rd setTo: 5. "Destination register x5"
	instruction immediateValue: 3. "Shift right by 3"
	
	"Because the sign bit (bit 32) in the source is 1, this
	is interpreted as a negative number. So new bits from the left
	will also be 1 to preserve the sign. Ie:
		2r10010000100111101010010101101011
		To:
		2r11110010000100111101010010101101"
	expected := 2r11110010000100111101010010101101.
	instruction executeOn: cpu.
	
	self assert: expected equals: (cpu registerNamed: #x5) value.