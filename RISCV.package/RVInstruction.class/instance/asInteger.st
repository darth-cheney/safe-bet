as yet unclassified
asInteger
	"Respond with the integer representation of
	this instruction, given its current settings."
	| result |
	result := 0.
	partsCollection do: [ :part |
		1 to: part size do: [ :partIdx |
			| adjusted |
			adjusted := part startIndex + (partIdx - 1).
			result := result bitAt: adjusted put: (part bitAt: partIdx)] ].
	^ result
	