as yet unclassified
immediateValue: anInteger
	"Set the internal representation of an overall immediate
	value to that of the incoming integer.
	Since immediates can be spread across the instruction in
	unordered parts, we must first get the correct order and
	then apply the bits of the incoming integer to each part
	at the correct indices.
	Note also that we simply drop any extra bits that come along"
	| adjustedIndex |
	self sortedImmediates do: [ :immediate |
		1 to: immediate size do: [ :localIdx |
			adjustedIndex := immediate immediateStartIndex + (localIdx - 1).
			immediate
				bitAt: localIdx
				put: (anInteger bitAt: adjustedIndex) ]  ]
	
