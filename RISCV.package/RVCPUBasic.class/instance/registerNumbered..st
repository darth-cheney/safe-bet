as yet unclassified
registerNumbered: aNumber
	"Respond with the register at the given index number"
	^ (registers atIndex: aNumber + 1) value.