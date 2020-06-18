as yet unclassified
immediateValue
	"Partial override. B-type instructions are specified in
	unsigned multiples of 2, so the first bit is always zero"
	^ super immediateValue << 1