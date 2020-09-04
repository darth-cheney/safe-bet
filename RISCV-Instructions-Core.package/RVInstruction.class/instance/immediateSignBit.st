as yet unclassified
immediateSignBit
	"Respond with the sign bit of the instruction's immediate
	value. In most cases (if signed), this will be the last bit in
	the immediate."
	| lastImmediate |
	lastImmediate := self sortedImmediates last.
	^ (lastImmediate asInteger bitAt: (lastImmediate size))