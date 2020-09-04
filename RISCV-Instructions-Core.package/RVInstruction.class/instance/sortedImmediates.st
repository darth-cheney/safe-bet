as yet unclassified
sortedImmediates
	"Return a collection of any immediate parts comprising
	the immediate for this instruction. Because immediate
	parts can be spread out across an instruction out of order,
	we use this method to sort them and return them in order"
	^ self immediates sort: [ :first :second | 
			first immediateStartIndex <= second immediateStartIndex ]