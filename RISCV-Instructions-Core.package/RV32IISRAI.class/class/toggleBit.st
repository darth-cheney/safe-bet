as yet unclassified
toggleBit
	"Override parent class implementation. This bit determines
	whether or not the instruction will be SRAI or SRLI. When it is set, it
	is SRAI. In all other cases, instructions of type RV32II should have it
	set to zero. See parent class implementation"
	^ 2r01