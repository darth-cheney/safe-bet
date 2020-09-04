as yet unclassified
fromIntegerWithoutOpcode: anInteger
	"Respond with the correct instance of a SYSTEM instruction subtype,
	based on other attributes besides the opcode (which is the same among them).
	The distinguishing attribute seems to be the first bit in the funct12 part of
	these instructions, which tells us whether we are to make an ECALL or EBREAK.
	
	NOTE: We only consider ECALL and EBREAK in this implementation!"
	| firstBitSet |
	firstBitSet := (2r000000000001 bitAnd: (anInteger >> 20)) = 2r1.
	firstBitSet
		ifTrue: [
				^ (RV32IEBREAK new
						setFromInteger: anInteger;
						yourself )]
		ifFalse: [
			^ (RV32IECALL new
					setFromInteger: anInteger;
					yourself) ]. 