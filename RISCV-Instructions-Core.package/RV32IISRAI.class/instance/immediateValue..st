as yet unclassified
immediateValue: anInteger
	"Override the default implementation.
	In SRAI, SLLI, SRLI instructions, we drop the upper
	7 bits and set them according to the instruction spec.
	Setting an immediate here should *only* set imm1/shamt
	and not imm2 at all"
	1 to: imm1 size do: [ :index |
		imm1 bitAt: index put: (anInteger bitAt: index) ]