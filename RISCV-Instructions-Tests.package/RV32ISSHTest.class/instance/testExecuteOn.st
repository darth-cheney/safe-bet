as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple CPU instance.
	Here we use the Basic CPU with 1024 bytes of memory"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 24.
	
	"Data will only be the lower 16 bit (2-bytes) of this value"
	(cpu registerNamed: #x3) value: 2r11111111111111111010010100101101. " 42285 (lower 2 bytes)"
	
	instruction := RV32ISSH new.
	instruction rs1 setTo: 2. "Source reg x2"
	instruction rs2 setTo: 3. "Source reg x3"
	instruction immediateValue: 2r111111111111. " 4095, but this is signed so it's -1. Therefore we expect the starting address to be 24 - 1 (23)"
	instruction executeOn: cpu.
	
	expected := #[  45  165 ]. "2r00101101, 2r10100101 lower byte first"
	self assert: expected equals: (cpu memory bytesAt: 23 numBytes: 2).