as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple cpu instance.
	Here we use the Basic CPU with 1024 bytes of memory"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.

	instruction := RV32IULUI new.
	instruction imm1 setTo: 2r10111111000100000000.
	instruction rd setTo: 3. "Dest reg x3"
	instruction executeOn: cpu.
	
	"We expect the top 20 bits of the dest register value
	to be set, and the bottom 12 bits to be 0, ie:
		2r11111111111111111111000000000000"
	expected := 2r10111111000100000000000000000000.
	self assert: expected equals: (cpu registerNamed: #x3) asUnsignedInteger.