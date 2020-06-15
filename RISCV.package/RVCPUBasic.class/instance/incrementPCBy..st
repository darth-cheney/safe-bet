as yet unclassified
incrementPCBy: anInteger
	"Increment the value currently held in the program counter register
	by the given integer amount."
	| pc |
	pc := self registerNamed: #pc.
	pc value: (pc value + anInteger)