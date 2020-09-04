as yet unclassified
applyTo: anInteger startingAt: aStartIndex
	"Insert the bits of this part into the incoming
	integer starting at the given index.
	The start index ends up representing the
	amount to bitshift our underlying value before
	bitOr.
	Responds with a new integer with this part
	value inserted."
	| resultVal |
	resultVal := anInteger.
	1 to: (self size) do: [ :myIndex |
		| adjustedTargetIndex |
		adjustedTargetIndex := aStartIndex + (myIndex - 1).
		resultVal := resultVal bitAt: adjustedTargetIndex put: (self bitAt: myIndex)].
	^ resultVal