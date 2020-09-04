as yet unclassified
setFromInteger: anInteger
	"Set each of the bits in each part of
	this instruction to the corresponding
	bits of the incoming integer. Note that
	this is inherently unsafe: static part values,
	like opcode, will be overwritten by whatever is in this
	integer. Use RVInstriction class >> #fromInteger:
	if you wish to parse instruction objects from their
	Integer form."
	partsCollection do: [ :part |
		part setFrom: anInteger startingAt: part startIndex ]