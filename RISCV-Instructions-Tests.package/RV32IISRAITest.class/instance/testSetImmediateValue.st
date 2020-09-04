as yet unclassified
testSetImmediateValue
	"Test the special overriding of #immediateValue
	We have to override this because of the way
	SRAI, SLLI, SRLI specialized I-types handle their
	immediates. See class comments for those instructions"
	| instruction incoming expectedShamt expectedImm2 |
	incoming := 2r111110000000000000001000100111. "1040187943"
	
	"We expect imm2 to be set by the Instruction class's initialization
	and to never change."
	expectedImm2 := 2r0100000.
	
	"We expect the shamt to be just the lower 5 bits
	of the incoming integer, dropping all others"
	expectedShamt := 2r00111.
	
	instruction := RV32IISRAI new.
	instruction rd setTo: 2r00001.
	instruction rs1 setTo: 2r00010.
	instruction shamt setTo: 2r00101. "Will be overwritten"
	
	instruction immediateValue: incoming.
	
	self assert: expectedShamt equals: instruction shamt asInteger.
	self assert: expectedImm2 equals: instruction imm2 asInteger.