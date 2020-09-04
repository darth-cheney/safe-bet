as yet unclassified
negateBit: aBit
	"Respond with 1 if the incoming bit is 0,
	and respond with 0 in all other instances"
	aBit = 0
		ifTrue: [ ^ 1].
	^ 0