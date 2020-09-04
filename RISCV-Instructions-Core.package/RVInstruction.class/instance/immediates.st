as yet unclassified
immediates
	"Respond with a collection of any RVImmediateParts
	that are part of this instruction. Note that in many cases
	they will be 'out of order'. For an ordered list of these
	parts, see #sortedImmediates"
	^ partsCollection select: [ :part | part isImmediatePart ].