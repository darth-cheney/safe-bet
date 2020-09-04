as yet unclassified
addPart: anRVInstructionPart
	"Adds the part to the end of the parts collection
	based on its partName.
	Because these are ordered, we also update the startIndex
	of the new part based on what parts are already in this
	collection's instructions.
	We signal an error if there is no partName set."
	anRVInstructionPart partName ifNil: [ Error signal: 'Can only add RVInstructionPart with a partName!'].
	
	"If this is the first part, just add it.
	Parts already default to start index 1"
	(partsCollection isEmpty)
		ifTrue: [ 
			partsCollection add: anRVInstructionPart.
			^ self ].
		
	"Otherwise, we get the last element in the collection
	and determine the startIndex based on its endIndex"
	anRVInstructionPart startingAt: (partsCollection last endIndex + 1).
	partsCollection add: anRVInstructionPart.