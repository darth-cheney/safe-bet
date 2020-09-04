as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Overrides any superclass implementation. As a J-type, for now JAL is the only
	instruction subtype, and therefore it is the only class that can be initialized
	based on a given opcode. See the OpcodeMapping on the class side of 
	RVInstruction for more information.
	
	Respond with an instance of the class with the correct opcode set."
	^ (self new
			setFromInteger: anInteger;
			yourself )