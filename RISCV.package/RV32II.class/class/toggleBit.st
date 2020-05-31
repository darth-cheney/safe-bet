as yet unclassified
toggleBit
	"The toggleBit is the second-to-last bit, held in the final
	immediate value. It is *only* relevant for making the distinction
	between SRAI and SRLI instructions. It will be set to 2r01
	for SRAI only"
	^ 2r00