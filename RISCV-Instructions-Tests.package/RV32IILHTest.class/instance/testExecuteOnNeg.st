as yet unclassified
testExecuteOnNeg
	"Test the execution of this instruction on a simple CPU instance.
	Here we are using a 32 bit CPU with 1024 bytes of addressable
	memory.
	We expect to load a sign-extended half-word (16bits) from the
	memory.
	In this test, we use both a (potentially) negative byte value AND
	a negative signed immediate value, the latter meaning we should
	retrieve from an address less than that in the source register"
	| cpu instruction |
	cpu := RVCPUBasic example1024.
	(cpu registerNamed: #x2) value: 22.
	(cpu memory bytesAt: 16 put: #[255 255]). "2r1111111111111111 (could be 65535 unsigned OR -1 when signed)"
	
	instruction := RV32IILH new.
	instruction rd setTo: 3. "Destination is x3 register"
	instruction rs1 setTo: 2. "Source is x2 register"
	instruction immediateValue: -6. "Should ask for address 16"
	instruction executeOn: cpu.
	
	"The loaded half-word is sign extended.
	In the signed case, the value should be -1 (since we've extended 65535, or 2r1111111111111111).
	In the unsigned case we expect 4294967295, which is equivalent to full set 32 bits, ie:
		2r11111111111111111111111111111111"
	self assert: (cpu registerNamed: #x3) asSignedInteger equals: -1.
	self assert: (cpu registerNamed: #x3) asUnsignedInteger equals: 4294967295.