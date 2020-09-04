as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with a configured FENCE instance based on the
	incoming integer. See the OpcodeMapping in RVInstruction class for
	more information"
	^ (self new
			setFromInteger: anInteger;
			yourself )