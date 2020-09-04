as yet unclassified
isSpecialized
	"Responds true if the given RV32II instruction class is of the
	'specialized' I-type. Specialized I-type instructions are those
	involving shifts on immediate values. These need to also check
	a special toggleBit in the final immediate part"
	^ true