as yet unclassified
value: anInteger
	"We copy the bits from the incoming integer up to the
	size of the register. When using this setter, we assume 
	the incoming integer is to be treated as unsigned, unless
	the incoming value is itself negative."

	1 to: self width do: [ :bitIndex |
		bits at: bitIndex put: (anInteger bitAt: bitIndex)].
	