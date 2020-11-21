as yet unclassified
testExecute64On
	"Test the execution of this instruction on a 64 bit CPU instance.
	Here we are using a 64 bit CPU with 2048 bytes of addressable
	memory.
	We expect to load a word (here 32 bits) from the
	memory.
	Because we are using a 64 bit system, we expect the stored value
	to be sign-extended"
	| cpu instruction |
	cpu := RVCPUBasic64 example2048.
	(cpu registerNamed: #x2) value: 48.
	
	"We use the following 32 bit int:
		2r11111111111111111111111101100101 (4294967141 or -155, in 32-bits)
		
	Which  should be sign extended to:
		2r1111111111111111111111111111111111111111111111111111111101100101 (18446744073709551461 or -155)"	
	(cpu memory bytesAt: 52 put: #[ 101 255 255 255 ]).
	
	instruction := RV32IILW new.
	instruction rs1 setTo: 2. "Source register x2"
	instruction rd setTo: 7. "Dest register x7"
	instruction immediateValue: 4. "Add 4 to rs1 to get address"
	instruction executeOn: cpu.
	
	"Due to the sign extension, we expect a signed value of:
	"
	self assert: 18446744073709551461 equals: (cpu registerNamed: #x7) asUnsignedInteger.
	self assert: -155 equals: (cpu registerNamed: #x7) asSignedInteger