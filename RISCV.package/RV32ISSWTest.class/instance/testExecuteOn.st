as yet unclassified
testExecuteOn
	"Test execution of this instruction on a simple CPU instance.
	Here we use the Basic CPU with 1024 bytes of memory"
	| cpu instruction expected |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x9) value: 2. "Start at mem addr 2"
	(cpu registerNamed: #x10) value: 2r11111111001000000010000011111111.
	
	instruction := RV32ISSW new.
	instruction rs1 setTo: 9. "Source reg x9"
	instruction rs2 setTo: 10. "Source reg x10"
	instruction immediateValue: 1.
	instruction executeOn: cpu.
	
	expected :=  #[255 32 32 255].
	self assert: expected equals: (cpu memory bytesAt: 3 numBytes: 4).