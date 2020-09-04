as yet unclassified
testExecuteOn
	"Test the execution of this instruction on a simple CPU instance.
	Here we are using a 32 bit CPU with 1024 bytes of addressable
	memory.
	We expect to load a sign-extended half-word (16bits) from the
	memory."
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 88.
	(cpu memory byteAt: 96 put: 127). "2r01111111"
	
	instruction := RV32IILH new.
	instruction rd setTo: 3. "Destination is x3"
	instruction rs1 setTo: 2. "Source is x2"
	instruction immediateValue: 8. "Offset is + 8"
	instruction executeOn: cpu.
	
	self assert: (cpu registerNamed: #x3) asSignedInteger equals: 127.
	self assert: (cpu registerNamed: #x3) asUnsignedInteger equals: 127.