as yet unclassified
applyToImmediate: anInteger startingAt: anIndex
	"Write the bits of this immediate part to an incoming
	Integer that will represent a more general (assembled)
	immediate value. Start at the given index"
	| resultVal start |
	resultVal := anInteger.
	start := self immediateStartIndex.
	1 to: self size do: [ :myIndex |
		| adjustedTargetIndex |
		adjustedTargetIndex := anIndex + (myIndex - 1).
		resultVal := resultVal bitAt: adjustedTargetIndex put: (self bitAt: myIndex)].
	^ resultVal