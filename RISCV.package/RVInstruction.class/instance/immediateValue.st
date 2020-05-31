as yet unclassified
immediateValue
	"Respond with the value of the immediate for this
	instruction.
	Senders should check #hasImmediate first, as
	instructions without immediates will respond with 0.
	We select and sort all immediate parts and then compute
	the actual bits, responding with the resulting Integer value."
	| immediates sorted result |
	result := 0.
	immediates := partsCollection select: [ :imm | imm isImmediatePart ].
	sorted := immediates sort: [ :first :second |
		first immediateStartIndex <= second immediateStartIndex ].
	sorted do: [ :immediate |
		result := immediate applyToImmediate: result ].
	^ result