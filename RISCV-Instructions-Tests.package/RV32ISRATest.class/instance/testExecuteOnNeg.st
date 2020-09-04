as yet unclassified
testExecuteOnNeg
	"Test execution of this instruction on a simple CPU.
	Here we are testing the case where the source value to
	be shifted should be treated as signed. Arithmetic right
	shifts preserve the sign bit."
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 2r10000000000001000101110000101011.
	(cpu registerNamed: #x3) value: 2r11111111111111111111111111100100. "Only takes lower 5 bits"
	
	instruction := RV32ISRA new.
	instruction rs1 setTo: 2. "Source reg x2"
	instruction rs2 setTo: 3. "Source reg x3; shift amount is lower 5 bits"
	instruction rd setTo: 4. "Dest reg x4"
	instruction executeOn: cpu.
	
	"We expect to shift right by 4 and preserve the 1 sign bit in
	the original value.
		from, to:
		2r10000000000001000101110000101011
		2r11111000000000000100010111000010."
	expected := 2r11111000000000000100010111000010.
	self assert: expected equals: (cpu registerNamed: #x4) value.