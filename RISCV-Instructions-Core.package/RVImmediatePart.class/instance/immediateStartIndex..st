as yet unclassified
immediateStartIndex: anInteger
	"Set the start index of the immediate value.
	Since immediates in a single instruction can be divided
	up among many different Instruction Parts, we need to
	specify what part of the overall immediate this part describes"
	immediateStart := anInteger